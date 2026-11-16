import 'package:freezed_annotation/freezed_annotation.dart';

part 'nationality_entity.freezed.dart';

/// A nationality the user can pick. [name] is the value `POST profile` takes.
@freezed
abstract class NationalityEntity with _$NationalityEntity {
  const factory NationalityEntity({required int id, required String name}) = _NationalityEntity;
}
