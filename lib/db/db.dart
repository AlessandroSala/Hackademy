import 'package:hackademy/models/lista.dart';
import 'package:hackademy/models/promemoria.dart';
import 'package:hackademy/models/serializable.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';

class DataBaseManager {
  static Database? database;

  static void addEntity<T extends Serializable>(T obj) {
    database?.insert(
      obj.tableName,
      obj.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Lista>> fetchLists() async {
    final objects = <Lista>[];
    if (database == null) return [];
    for (Map<String, dynamic> map in await database!.query('liste')) {
      objects.add(Lista.fromMap(map));
    }
    return objects;
  }

  static Future<List<Promemoria>> fetchPromemoria() async {
    final objects = <Promemoria>[];
    if (database == null) return [];
    for (Map<String, dynamic> map in await database!.query('liste')) {
      objects.add(Promemoria.fromMap(map));
    }
    return objects;
  }
}
