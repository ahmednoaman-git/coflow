---
description: Up-to-date information on Flutter/Dart and Freezed that may not be in AI training data
---

# Up-to-date Information for Coding Agents

This document outlines some updated information that may not be included in the training data for the GitHub Copilot models.

## Flutter & Dart

- Columns and Rows now support a `spacing` parameter to set uniform spacing between children, always use this feature instead of manually adding `SizedBox` or `Padding` widgets between children, except for special cases where different spacing is needed.

```dart
Column(
  spacing: 8.0, // Sets 8.0 pixels of spacing between children
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```

- `Color.withOpacity()` is now deprecated. Use `Color.withValues(alpha: (0 to 1))` instead.

- There is a new shape called `RoundedSuperellipseBorder` for creating superellipse shapes (iOS-style rounded rectangles). It is used in this project extensively for any rounded rectangles, no standard `RoundedRectangleBorder` should be used for that purpose or `BoxDecoration` with `BorderRadius`.
**Note:** The `RoundedSuperellipseBorder` is part of the standard Flutter SDK now. You don't need to import any external packages to use it, just `material`, `cupertino`, or `widgets`.

```dart
Container(
  decoration: ShapeDecoration(
    shape: RoundedSuperellipseBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    color: Colors.blue,
  ),
  child: ...
)
```

## Freezed

### Migrate from v2 to v3

Require keyword (sealed / abstract)
Classes using the factory constructor now require a keyword sealed / abstract.

```dart
@freezed
-class Person with _$Person {
+abstract class Person with _$Person {
  const factory Person({
    required String firstName,
    required String lastName,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json)
      => _$PersonFromJson(json);
}
```
```dart
@freezed
-class Model with _$Model {
+sealed class Model with _$Model {
  factory Model.first(String a) = First;
  factory Model.second(int b, bool c) = Second;
}
```

### Pattern matching

Freezed no longer generates .map/.when extensions and their derivatives for freezed classes used for pattern matching. Instead, use Dart's built-in pattern matching syntax.

```dart
final model = Model.first('42');

-final res = model.map(
-  first: (String a) => 'first $a',
-  second: (int b, bool c) => 'second $b $c',
-);
+final res = switch (model) {
+  First(:final a) => 'first $a',
+  Second(:final b, :final c) => 'second $b $c',
+};
```

### Mixed mode

Freezed 3.0 introduces a "mixed mode". Freezed now supports both the traditional factory-style syntax and a simpler class-style syntax for plain data holders.

Usual factory-style (unchanged for unions):

```dart
@freezed
sealed class Usual with _$Usual {
  factory Usual({int a}) = _Usual;
}
```

Or the new simple class-style for straightforward immutable classes:

```dart
@freezed
class Usual with _$Usual {
  Usual({this.a});
  final int a;
}
```

Benefits:
- Simple classes can avoid Freezed's factory-only syntax and remain concise.
- Unions and complex cases can continue using factory constructors.
- Allows using full constructor features such as initializers and calling super():

```dart
class Base {
  Base(String value);
}

@freezed
class Usual extends Base with _$Usual {
  Usual({int? a}) : a = a ?? 0, super('value');
  final int a;
}
```

### Inheritance and non-constant default values

Freezed 3.0 addresses two long-standing limitations: lack of extends support and inability to use non-constant default values in generated code.

Besides the Mixed mode, Freezed now allows factory constructors to specify non-constant defaults and call `super()` by relying on a non-factory `MyClass._()` constructor.

This has another important benefit: complex unions can now use inheritance and non-constant defaults by providing a non-factory `MyClass._()` constructor.

Context (previous requirement): when a Freezed class declared methods or properties, it had to declare a parameterless `MyClass._()` constructor for those members to work:

```dart
@freezed
class Example with _$Example {
  // Necessary for helloWorld() to work
  Example._();
  factory Example(String name) = _Example;

  void helloWorld() => print('Hello $name');
}
```

Starting with Freezed 3.0, `MyClass._()` may accept parameters. Freezed will pass values from factory constructors to this private constructor by name. That enables extending other classes and supporting non-constant defaults.

Example — extending a class and receiving parameters:

```dart
class Subclass {
  Subclass.name(this.value);
  final int value;
}

@freezed
class MyFreezedClass extends Subclass with _$MyFreezedClass {
  // We can receive parameters in this constructor, which we can use with `super.field`
  MyFreezedClass._(super.value) : super.name();

  factory MyFreezedClass(int value /*, other fields */) = _MyFreezedClass;
}
```

Example — non-constant default value using `._()`:

```dart
@freezed
sealed class Response<T> with _$Response<T> {
  // We give "time" a non-constant default
  Response._({DateTime? time}) : time = time ?? DateTime.now();

  // Constructors may forward parameters to ._();
  factory Response.data(T value, {DateTime? time}) = ResponseData;
  // If ._ parameters are named and optional, factory constructors need not specify them
  factory Response.error(Object error) = ResponseError;

  @override
  final DateTime time;
}
```

### "Eject" union cases (custom union subclasses)

Freezed 3.0 allows a union case to be "ejected" and implemented by a manual class in the same library. If you provide a concrete class for a case, Freezed will not generate it and will treat it as a user-defined subclass.

Example:

```dart
@freezed
sealed class Result<T> with _$Result<T> {
  Result._();
  // Data will be generated by Freezed
  factory Result.data(T data) = ResultData;
  // We provide `ResultError` manually, so Freezed won't generate it
  factory Result.error(Object error) = ResultError;
}

// We manually wrote `ResultError`
class ResultError<T> extends Result<T> {
  ResultError(this.error) : super._();
  final Object error;
}
```

This works together with Mixed mode: an extracted union case itself can be a Freezed class (either simple or factory-based).

Examples of extracted case implemented with Freezed:

```dart
// Using simple class-style Freezed
@freezed
class ResultError<T> extends Result<T> {
  ResultError(this.error) : super._();
  final Object error;
}

// Or using a factory + private ctor
@freezed
class ResultError<T> extends Result<T> {
  ResultError._() : super._();
  factory ResultError(Object error) = _ResultError;
}
```

Note: Because Dart does not support sealed mixin classes, it is required to `extends` the parent class (for example `extends Result<T>`) when ejecting a case rather than using `with Result<T>`.

### Other changes

- Breaking: Removed `map`/`when` and variants — prefer Dart's pattern matching.
- Breaking: Freezed classes should now be either `abstract`, `sealed`, or manually implement `_$MyClass`.
- Formatting: When formatting is disabled (default for generated files), Freezed now emits `// dart format off` to avoid CI formatting conflicts.
- New: private constructors for unions are supported. You can now write private union constructors:

```dart
@freezed
sealed class Result<T> with _$Result<T> {
  // Previously not allowed, now possible
  factory Result._data(T data) = ResultData;
  factory Result.error(Object error) = ResultError;
}
```
