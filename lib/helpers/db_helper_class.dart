import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelperClass {
  Future<Database> initDB(
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

  Future<bool> insertData({
    dynamic dataModel,
    String dataString = '',
  }) async {
    final Database db = await initDB();
    db.insert("MYTable", dataModel.toMap());
    return true;
  }

  Future<List<dynamic>> getData(dynamic dataModel) async {
    final Database db = await initDB();
    final List<Map<String, Object?>> datas = await db.query("MYTable");
    return datas.map((e) => dataModel.fromMap(e)).toList();
  }

  Future<void> update(dynamic dataModel, int id) async {
    final Database db = await initDB();
    await db
        .update("MYTable", dataModel.toMap(), where: "id=?", whereArgs: [id]);
  }

  Future<void> delete(int id) async {
    final Database db = await initDB();
    await db.delete("MYTable", where: "id=?", whereArgs: [id]);
  }
}
