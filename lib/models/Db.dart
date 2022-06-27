import 'dart:async';
//import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:uuid/uuid.dart';

class DataToken {
  final String uid;

  const DataToken({required this.uid});

  Map<String, dynamic> toMap() {
    return {'uid': uid};
  }

  @override
  String toString() {
    return "DataToken{uid: $uid}";
  }
}

class Db {
  static late final Future<Database> database;

  void connect() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(join(await getDatabasesPath(), 'tokens.db'),
        onCreate: (db, version) {
      return db.execute(
        "create table token (uid text primary text);",
      );
    });
  }

  Future<void> insertToken(DataToken token) async {
    final db = await database;
    await db.insert("token", token.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<DataToken>> getToken() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("token");

    return List.generate(maps.length, (index) {
      return DataToken(uid: maps[index]["uid"]);
    });
  }
}
