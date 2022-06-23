import 'package:sqflite/sqflite.dart';

class DbManager {
  static Future<Database> openDb() async {
    final path = await getDatabasesPath() + 'dog_db.db';
    final database =
        await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    });

    return database;
  }
}
