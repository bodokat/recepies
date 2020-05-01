import 'package:freezed_annotation/freezed_annotation.dart';

part 'recepie.freezed.dart';

@freezed
abstract class Recepie with _$Recepie {
  const factory Recepie(
      {@required int id,
      @required String title,
      @required String body,
      @required Map<Ingredient, int> ingredients}) = _Recepie;
}

@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({@required int id, @required String name}) = _Ingredient;
}

@freezed
abstract class SmallRecepie with _$SmallRecepie {
  const factory SmallRecepie({@required int id, @required String title}) = _SmallRecepie;
}
