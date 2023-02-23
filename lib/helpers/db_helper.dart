import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class dbhelper {
  static Future<sql.Database>database()async{
    final dbpath = await sql.getDatabasesPath();
    return  await sql.openDatabase(path.join(dbpath, 'places.db '),
        onCreate: (db, version) {
          return db.execute(
              'CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT,image TEXT )');
        }, version: 1);
  }

  //inserting in database
  static Future<void> insert(String table, Map<String, Object> data) async {

    final db=await dbhelper.database();
    db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }
//fetching from database
  static Future<List<Map<String,dynamic>>>getData(String table)async {
    final db=await dbhelper.database();
    return db.query(table);
  }
}
