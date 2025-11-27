import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../utils/typedefs.dart';

/// A wrapper class for Hive to handle caching operations.
@lazySingleton
class CacheClient {
  static const String _defaultBoxName = 'app_cache';
  late Box<dynamic> _box;
  Box<dynamic> get box => _box;

  /// Initialize the cache client
  /// [boxName] - Optional name for the Hive box
  @PostConstruct(preResolve: true)
  Future<void> init({String boxName = _defaultBoxName}) async {
    await Hive.initFlutter();
    _box = await Hive.openBox(boxName);
  }

  /// Store a value in the cache
  /// [key] - The key to store the value under
  /// [value] - The value to store
  /// [expiryDuration] - Optional duration after which the value should expire
  Future<void> put(String key, dynamic value, {Duration? expiryDuration}) async {
    if (expiryDuration != null) {
      final expiryTime = DateTime.now().add(expiryDuration);
      await _box.put(key, {
        'value': value,
        'expiryTime': expiryTime.millisecondsSinceEpoch,
      });
    } else {
      await _box.put(key, {'value': value});
    }
  }

  /// Retrieve a value from the cache
  /// [key] - The key to retrieve the value for
  /// Returns null if the key doesn't exist or the value has expired
  T? get<T>(String key, {T? defaultValue}) {
    final data = _box.get(key);
    if (data == null) return defaultValue;

    final expiryTime = data['expiryTime'];
    if (expiryTime != null) {
      final expired = DateTime.fromMillisecondsSinceEpoch(
        expiryTime as int,
      ).isBefore(DateTime.now());
      if (expired) {
        _box.delete(key);
        return null;
      }
    }

    if (T == Json) {
      if (data['value'] == null) return null;
      return Json.from(data['value'] as Map) as T;
    }

    return data['value'] as T?;
  }

  Future<void> remove(String key) async {
    await _box.delete(key);
  }

  Future<void> clear() async {
    await _box.clear();
  }

  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  List<String> getAllKeys() {
    return _box.keys.cast<String>().toList();
  }

  Future<void> close() async {
    await _box.close();
  }
}
