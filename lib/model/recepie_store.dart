import 'package:mobx/mobx.dart';
import 'package:recepies/data/database.dart' show MyDatabase;
import 'package:recepies/entities/recepie.dart';

part 'recepie_store.g.dart';

class RecepieStore = _RecepieStore with _$RecepieStore;

abstract class _RecepieStore with Store {
  final MyDatabase _db;

  _RecepieStore(this._db) {
    homepageEntries = ObservableStream(_db.smallRecepiesDao.watchAll());
  }

  ObservableStream<List<SmallRecepie>> homepageEntries;

  ObservableMap<SmallRecepie, int> selected = ObservableMap();

  @computed
  Future<Map<Ingredient, int>> get totalIngredients async {
    var ingredientList = await Future.wait(selected.entries
        .map((entry) async => MapEntry(await _db.recepiesDao.getIngredients(entry.key.id), entry.value)));
    var result = <Ingredient, int>{};
    for (var entry in ingredientList) {
      var ingredients = entry.key; // the ingredients of the current recepie
      var recepieAmount = entry.value; // how many times the recepie is selected
      ingredients = ingredients.map((ing, amount) => MapEntry(ing, amount * recepieAmount)); // scale ingredients
      result.addAllWith(ingredients, (prevAmount, newAmount) => prevAmount + newAmount); // add ingredients to result
    }
    return result;
  }

  Future<void> addRecepie(Recepie recepie) => _db.recepiesDao.insertRecepie(recepie);
  //Future<bool> updateRecepie(Recepie recepie) => _db.recepiesDao.updateRecepie(recepie);
  Future<int> deleteRecepie(Recepie recepie) => _db.recepiesDao.deleteRecepie(recepie);

  Future<Recepie> getFullRecepie(SmallRecepie recepie) => _db.recepiesDao.getById(recepie.id);
}

extension<K, V> on Map<K, V> {
  ///Adds all key/value pairs of [other] to this map, combining them with values in this map.
  ///
  ///If a key of [other] is already in this map, its value is replaced with f(this[k], other[k]).
  ///
  ///```dart
  ///    Map<String,int> scores = {'Alice': 2, 'Bob': 1};
  ///    Map<String,int> newScores = {'Bob': 3, 'Rohan': 1};
  ///    scores.addAllWith(newScores, (int a, int b) => a + b);
  ///    print(scores); //{Alice: 2, Bob: 4, Rohan: 1}
  ///```

  void addAllWith(Map<K, V> other, V Function(V, V) f) {
    for (final entry in other.entries) {
      if (containsKey(entry.key)) {
        this[entry.key] = f(this[entry.key], entry.value);
      } else {
        this[entry.key] = entry.value;
      }
    }
  }
}
