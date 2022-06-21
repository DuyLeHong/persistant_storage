import 'package:persistant_storage/data/model/dog.dart';
import 'package:sqflite/sqflite.dart';

import 'db_manager.dart';

class DogStorage {
  DogStorage();

  Future<List<Dog>> getAllDog() async {
    final db = await DbManager.openDb();
    final List<Map<String, dynamic>> dogMap = await db.query('dogs');

    print('hoan.dv: list dog: ${dogMap.length}');

    return List.generate(dogMap.length, (index) {
      return Dog(
          id: dogMap[index]['id'],
          name: dogMap[index]['name'],
          age: dogMap[index]['age']);
    });
  }

  Future insertDog(Dog dog) async {
    final db = await DbManager.openDb();
    final id = await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('hoan.dv: row of dog $id');
  }

  Future deleteDog(int id) async {}
}
