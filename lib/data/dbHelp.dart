import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:inspection_app/data/cars.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database _db;
  static const String ID = "id";
  static const String REGNR = "regNr";
  static const String ICON = "icon";
  static const String INSPECTIONDATE = "inspectionDate";
  static const String TABLE = "Cars";
  static const String DB_NAME = "cars.db";


  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $REGNR TEXT, $ICON INTEGER, $INSPECTIONDATE TEXT");
  }

  Future<SavedCars> save (SavedCars savedCars) async {
    var dbClient = await db;
    savedCars.id = await dbClient.insert(TABLE, savedCars.toMap());
  }

  Future<List<SavedCars>> getSavedCars() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, REGNR, ICON, INSPECTIONDATE]);
    List<SavedCars> savedCars = [];
    if (maps.length > 0){
      for(int i=0; i< maps.length; i++) {
        savedCars.add(SavedCars.fromMap(maps[i]));
      }
    }
    return savedCars;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: "$ID = ?", whereArgs: [id]);
  }

  Future<int> update(SavedCars savedCars) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, savedCars.toMap(), where:"$ID = ?", whereArgs: [savedCars.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}