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

  ObservableSet<SmallRecepie> selected = ObservableSet();

  @computed
  Future<Map<Ingredient, int>> get totalIngredients async {
    final ingredientList = await Future.wait(selected.map((recepie) => _db.recepiesDao.getIngredients(recepie.id)));
    return ingredientList.fold<Map<Ingredient, int>>(
        Map(), (previousMap, nextMap) => previousMap..addAllWith(nextMap, (x, y) => x + y));
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
  ///    Map<String,int> scores1 = {'Alice': 2, 'Bob': 1};
  ///    Map<String,int> scores2 = {'Bob': 3, 'Rohan': 1};
  ///    final scores = scores1.addAllWith(scores2, (int a, int b) => a + b);
  ///    print(scores); //{Alice: 2, Bob: 4, Rohan: 1}
  ///```

  void addAllWith(Map<K, V> other, V Function(V, V) f) {
    for (final entry in other.entries) {
      if (this.containsKey(entry.key)) {
        this[entry.key] = f(this[entry.key], entry.value);
      } else {
        this[entry.key] = entry.value;
      }
    }
  }
}
