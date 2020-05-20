import 'package:mobx/mobx.dart';
import 'package:recepies/data/database.dart' show MyDatabase;
import 'package:recepies/entities/recepie.dart';

part 'ingredient_store.g.dart';

class IngredientStore = _IngredientStore with _$IngredientStore;

abstract class _IngredientStore with Store {
  final MyDatabase _db;

  _IngredientStore(this._db) {
    allIngredients = ObservableStream(_db.ingredientsDao.watchAll());
  }

  ObservableStream<List<Ingredient>> allIngredients;

  Future<Ingredient> addIngredient(Ingredient ingredient) => _db.ingredientsDao.insertIngredient(ingredient);
  Future<int> deleteIngredient(Ingredient ingredient) => _db.ingredientsDao.deleteIngredient(ingredient);
}
