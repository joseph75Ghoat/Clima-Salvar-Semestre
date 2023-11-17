


// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'place.dart';

// class DatabaseHelper {
//   static Database? _database;
//   static const String tableName = 'places';

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await initDatabase();
//     return _database!;
//   }

//   Future<Database> initDatabase() async {
//     final path = join(await getDatabasesPath(), 'places_database.db');
//     return openDatabase(path, version: 1, onCreate: (db, version) async {
//       await db.execute('''
//         CREATE TABLE $tableName (
//           name TEXT,
//           temperature REAL,
//           latitude REAL,
//           longitude REAL
//         )
//       ''');
//     });
//   }

//   Future<void> insertPlace(Place place) async {
//     final db = await database;
//     await db.insert(tableName, place.toMap());
//   }

//   Future<List<Place>> getPlaces() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query(tableName);
//     return List.generate(maps.length, (i) {
//       return Place(
//         name: maps[i]['name'],
//         temperature: maps[i]['temperature'],
//         latitude: maps[i]['latitude'],
//         longitude: maps[i]['longitude'],
//       );
//     });
//   }
// }

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'place.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'places';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'places_database.db');
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE $tableName (
          name TEXT,
          temperature REAL,
          latitude REAL,
          longitude REAL
        )
      ''');
    });
  }

  Future<void> insertPlace(Place place) async {
    final db = await database;
    await db.insert(tableName, place.toMap());
  }

  Future<List<Place>> getPlaces() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (i) {
      return Place(
        name: maps[i]['name'],
        temperature: maps[i]['temperature'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
      );
    });
  }

  Future<void> deletePlace(Place place) async {
    final db = await database;
    await db.delete(
      tableName,
      where: 'name = ?',
      whereArgs: [place.name],
    );
  }
}

