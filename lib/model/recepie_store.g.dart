// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recepie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecepieStore on _RecepieStore, Store {
  Computed<Future<Map<Ingredient, int>>> _$totalIngredientsComputed;

  @override
  Future<Map<Ingredient, int>> get totalIngredients =>
      (_$totalIngredientsComputed ??= Computed<Future<Map<Ingredient, int>>>(
              () => super.totalIngredients))
          .value;

  @override
  String toString() {
    final string = 'totalIngredients: ${totalIngredients.toString()}';
    return '{$string}';
  }
}