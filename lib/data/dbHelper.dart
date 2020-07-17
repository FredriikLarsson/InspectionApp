import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:inspection_app/data/car.dart';

class DBHelper {
  static Database _db;
  static const String ID = "id";
  static const String REGNR = "regNr";
  static const String CARICON = "carIcon";
  static const String TABLE = "Car";
  static const String DB_NAME = "car.db";

  //Check if there is an existing database and if not then initialize a new one
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  //Search for a documentsdirectory to initialize the database
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  //Create the database
  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $REGNR TEXT, $CARICON INTEGER)");
  }

  //Insert a new car to the database
  Future<Car> save(Car car) async {
    var dbClient = await db;
    car.id = await dbClient.insert(TABLE, car.toMap());
    return car;
  }

  //get all the cars from the database
  Future<List<Car>> getCars() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, REGNR, CARICON]);
    List<Car> cars = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        cars.add(Car.fromMap(maps[i]));
      }
    }
    return cars;
  }

  //Delete a row in the database table
  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: "$ID = ?", whereArgs: [id]);
  }

  //Update a row in the database table
  Future<int> update(Car car) async {
    var dbClient = await db;
    return await dbClient
        .update(TABLE, car.toMap(), where: "$ID = ?", whereArgs: [car.id]);
  }

  //Close the database
  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
