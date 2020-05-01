// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'recepie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RecepieTearOff {
  const _$RecepieTearOff();

  _Recepie call(
      {@required int id,
      @required String title,
      @required String body,
      @required Map<Ingredient, int> ingredients}) {
    return _Recepie(
      id: id,
      title: title,
      body: body,
      ingredients: ingredients,
    );
  }
}

// ignore: unused_element
const $Recepie = _$RecepieTearOff();

mixin _$Recepie {
  int get id;
  String get title;
  String get body;
  Map<Ingredient, int> get ingredients;

  $RecepieCopyWith<Recepie> get copyWith;
}

abstract class $RecepieCopyWith<$Res> {
  factory $RecepieCopyWith(Recepie value, $Res Function(Recepie) then) =
      _$RecepieCopyWithImpl<$Res>;
  $Res call(
      {int id, String title, String body, Map<Ingredient, int> ingredients});
}

class _$RecepieCopyWithImpl<$Res> implements $RecepieCopyWith<$Res> {
  _$RecepieCopyWithImpl(this._value, this._then);

  final Recepie _value;
  // ignore: unused_field
  final $Res Function(Recepie) _then;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object body = freezed,
    Object ingredients = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      title: title == freezed ? _value.title : title as String,
      body: body == freezed ? _value.body : body as String,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients as Map<Ingredient, int>,
    ));
  }
}

abstract class _$RecepieCopyWith<$Res> implements $RecepieCopyWith<$Res> {
  factory _$RecepieCopyWith(_Recepie value, $Res Function(_Recepie) then) =
      __$RecepieCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id, String title, String body, Map<Ingredient, int> ingredients});
}

class __$RecepieCopyWithImpl<$Res> extends _$RecepieCopyWithImpl<$Res>
    implements _$RecepieCopyWith<$Res> {
  __$RecepieCopyWithImpl(_Recepie _value, $Res Function(_Recepie) _then)
      : super(_value, (v) => _then(v as _Recepie));

  @override
  _Recepie get _value => super._value as _Recepie;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object body = freezed,
    Object ingredients = freezed,
  }) {
    return _then(_Recepie(
      id: id == freezed ? _value.id : id as int,
      title: title == freezed ? _value.title : title as String,
      body: body == freezed ? _value.body : body as String,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients as Map<Ingredient, int>,
    ));
  }
}

class _$_Recepie implements _Recepie {
  const _$_Recepie(
      {@required this.id,
      @required this.title,
      @required this.body,
      @required this.ingredients})
      : assert(id != null),
        assert(title != null),
        assert(body != null),
        assert(ingredients != null);

  @override
  final int id;
  @override
  final String title;
  @override
  final String body;
  @override
  final Map<Ingredient, int> ingredients;

  @override
  String toString() {
    return 'Recepie(id: $id, title: $title, body: $body, ingredients: $ingredients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Recepie &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.ingredients, ingredients) ||
                const DeepCollectionEquality()
                    .equals(other.ingredients, ingredients)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(ingredients);

  @override
  _$RecepieCopyWith<_Recepie> get copyWith =>
      __$RecepieCopyWithImpl<_Recepie>(this, _$identity);
}

abstract class _Recepie implements Recepie {
  const factory _Recepie(
      {@required int id,
      @required String title,
      @required String body,
      @required Map<Ingredient, int> ingredients}) = _$_Recepie;

  @override
  int get id;
  @override
  String get title;
  @override
  String get body;
  @override
  Map<Ingredient, int> get ingredients;
  @override
  _$RecepieCopyWith<_Recepie> get copyWith;
}

class _$IngredientTearOff {
  const _$IngredientTearOff();

  _Ingredient call({@required int id, @required String name}) {
    return _Ingredient(
      id: id,
      name: name,
    );
  }
}

// ignore: unused_element
const $Ingredient = _$IngredientTearOff();

mixin _$Ingredient {
  int get id;
  String get name;

  $IngredientCopyWith<Ingredient> get copyWith;
}

abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

class _$IngredientCopyWithImpl<$Res> implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  final Ingredient _value;
  // ignore: unused_field
  final $Res Function(Ingredient) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

abstract class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(
          _Ingredient value, $Res Function(_Ingredient) then) =
      __$IngredientCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

class __$IngredientCopyWithImpl<$Res> extends _$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(
      _Ingredient _value, $Res Function(_Ingredient) _then)
      : super(_value, (v) => _then(v as _Ingredient));

  @override
  _Ingredient get _value => super._value as _Ingredient;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_Ingredient(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

class _$_Ingredient implements _Ingredient {
  const _$_Ingredient({@required this.id, @required this.name})
      : assert(id != null),
        assert(name != null);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Ingredient(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Ingredient &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);
}

abstract class _Ingredient implements Ingredient {
  const factory _Ingredient({@required int id, @required String name}) =
      _$_Ingredient;

  @override
  int get id;
  @override
  String get name;
  @override
  _$IngredientCopyWith<_Ingredient> get copyWith;
}

class _$SmallRecepieTearOff {
  const _$SmallRecepieTearOff();

  _SmallRecepie call({@required int id, @required String title}) {
    return _SmallRecepie(
      id: id,
      title: title,
    );
  }
}

// ignore: unused_element
const $SmallRecepie = _$SmallRecepieTearOff();

mixin _$SmallRecepie {
  int get id;
  String get title;

  $SmallRecepieCopyWith<SmallRecepie> get copyWith;
}

abstract class $SmallRecepieCopyWith<$Res> {
  factory $SmallRecepieCopyWith(
          SmallRecepie value, $Res Function(SmallRecepie) then) =
      _$SmallRecepieCopyWithImpl<$Res>;
  $Res call({int id, String title});
}

class _$SmallRecepieCopyWithImpl<$Res> implements $SmallRecepieCopyWith<$Res> {
  _$SmallRecepieCopyWithImpl(this._value, this._then);

  final SmallRecepie _value;
  // ignore: unused_field
  final $Res Function(SmallRecepie) _then;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

abstract class _$SmallRecepieCopyWith<$Res>
    implements $SmallRecepieCopyWith<$Res> {
  factory _$SmallRecepieCopyWith(
          _SmallRecepie value, $Res Function(_SmallRecepie) then) =
      __$SmallRecepieCopyWithImpl<$Res>;
  @override
  $Res call({int id, String title});
}

class __$SmallRecepieCopyWithImpl<$Res> extends _$SmallRecepieCopyWithImpl<$Res>
    implements _$SmallRecepieCopyWith<$Res> {
  __$SmallRecepieCopyWithImpl(
      _SmallRecepie _value, $Res Function(_SmallRecepie) _then)
      : super(_value, (v) => _then(v as _SmallRecepie));

  @override
  _SmallRecepie get _value => super._value as _SmallRecepie;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
  }) {
    return _then(_SmallRecepie(
      id: id == freezed ? _value.id : id as int,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

class _$_SmallRecepie implements _SmallRecepie {
  const _$_SmallRecepie({@required this.id, @required this.title})
      : assert(id != null),
        assert(title != null);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'SmallRecepie(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SmallRecepie &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title);

  @override
  _$SmallRecepieCopyWith<_SmallRecepie> get copyWith =>
      __$SmallRecepieCopyWithImpl<_SmallRecepie>(this, _$identity);
}

abstract class _SmallRecepie implements SmallRecepie {
  const factory _SmallRecepie({@required int id, @required String title}) =
      _$_SmallRecepie;

  @override
  int get id;
  @override
  String get title;
  @override
  _$SmallRecepieCopyWith<_SmallRecepie> get copyWith;
}
