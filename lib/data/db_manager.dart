import 'package:sqflite/sqflite.dart';

class DbManager {
  static Future<Database> openDb() async {
    final database = await openDatabase('dog_db.db', onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    });

    return database;
  }
}
