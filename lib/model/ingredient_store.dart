import 'package:recepies/data/database.dart' show MyDatabase;
import 'package:recepies/entities/recepie.dart';

class IngredientStore {
  final MyDatabase _db;

  IngredientStore(this._db) {
    allIngredients = _db.ingredientsDao.watchAll();
  }

  Stream<List<Ingredient>> allIngredients;

  Future<Ingredient> addIngredient(Ingredient ingredient) => _db.ingredientsDao.insertIngredient(ingredient);
  Future<int> deleteIngredient(Ingredient ingredient) => _db.ingredientsDao.deleteIngredient(ingredient);
}
