import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//STILL WORKING ON THIS CLASS

class DbHelperClass {
  static Future<Database> initDB(
      {String databaseName = "", String createTableQuery = ""}) async {
    //databaseName = "MYDb.db";
    // createTableQuery = """
    //    CREATE TABLE MYTable(
    //    id INTEGER PRIMARY KEY AUTOINCREMENT,
    //    title TEXT NOT NULL,
    //  subtitle TEXT NOT NULL
    //    )
    //  """
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, databaseName),
      onCreate: (database, verison) async {
        await database.execute(createTableQuery);
      },
      version: 1,
    );
  }

  static Future<bool> insertData({
    dynamic dataModel,
    required String tableName,
    required String createTableQuery,
    required String databaseName,
  }) async {
    final Database db = await initDB(
        createTableQuery: createTableQuery, databaseName: databaseName);
    db.insert(tableName, dataModel.toMap());
    return true;
  }

  Future<List<dynamic>> getData({
    dynamic dataModel,
    required String tableName,
    required String createTableQuery,
    required String databaseName,
  }) async {
    final Database db = await initDB(
        createTableQuery: createTableQuery, databaseName: databaseName);
    final List<Map<String, Object?>> datas = await db.query(tableName);
    return datas.map((e) => dataModel.fromMap(e)).toList();
  }

  Future<void> update({
    dynamic dataModel,
    required int id,
    required String tableName,
    required String createTableQuery,
    required String databaseName,
  }) async {
    final Database db = await initDB(
        createTableQuery: createTableQuery, databaseName: databaseName);
    await db
        .update(tableName, dataModel.toMap(), where: "id=?", whereArgs: [id]);
  }

  Future<void> delete({
    required int id,
    dynamic dataModel,
    required String tableName,
    required String createTableQuery,
    required String databaseName,
  }) async {
    final Database db = await initDB(
        createTableQuery: createTableQuery, databaseName: databaseName);
    await db.delete(tableName, where: "id=?", whereArgs: [id]);
  }
}
