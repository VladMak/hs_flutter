import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'dart:convert';

class Api {
  Future<String> registration(
      {String name = "Член",
      String email = "xyu@123",
      String pswd = "sdf"}) async {
    // законнектились к локальному хранилищу токена
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(join(await getDatabasesPath(), 'tokens.db'),
        version: 1, onCreate: (db, version) {
      return db.execute(
        "create table token (uid text primary key, ukmid text);",
      );
    });

    // генерим ЮИД
    var uuid = Uuid();
    var uuid_res = uuid.v4();

    var url = Uri.parse('https://smmon.slata.com/getOrder/go.php');

    var newbody = '{"token": "jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "0","name": "$name","card": "0","email": "$email","password": "$pswd","enter": "reg",
    "userToken": "0eedc517-da6d-4d28-bc6e-9e026d348a71",
    "level": 0,
    "nextLevel": 0,
    "sumShop": 0.0,
    "countBonus": 0.0
}';
    // делаем запрос к удаленному хосту, к бд там.
    var response = await http.post(url,
        body:
            '{"token":"jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "$uuid_res","name": "$name","card": "12312457","email": "$email", "password": "$pswd", "enter": "reg"}');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //final test = jsonDecode(response.body);
    //print(test);

    if (response.body == "") {
      return "false";
    }

    //db.insertToken(DataToken(uid: response.body));
    var token = DataToken(uid: response.body, ukmid: "");
    final db = await database;
    db.execute("drop table token;");
    db.execute("create table token (uid text primary key, ukmid text);");
    await db.execute(
      "delete from token;",
    );
    await db.insert("token", token.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    final List<Map<String, dynamic>> maps = await db.query("token");

    print(List.generate(maps.length, (index) {
      return DataToken(uid: maps[index]["uid"], ukmid: "");
    }));
    return response.body;
    //print(db.getToken());
    //print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }

  Future<bool> login(
      {String name = "Член",
      String email = "xyu@123",
      String pswd = "sdf"}) async {
    var url = Uri.parse('https://smmon.slata.com/getOrder/go.php');

    var response = await http.post(url,
        body:
            '{"token":"jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "aecd49c9-70c3-4aef-8c68-ce5bc54005ad","name": "$name","card": "123124","email": "$email", "password": "$pswd", "enter": "login"}');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.body == "") {
      return false;
    }

    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(join(await getDatabasesPath(), 'tokens.db'),
        version: 1, onCreate: (db, version) {
      return db.execute(
        "create table token (uid text primary key, ukmid text);",
      );
    });
    var token = DataToken(uid: response.body, ukmid: "");
    final db = await database;
    await db.insert("token", token.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return true;
    //print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }

  Future<bool> checkToken(String localToken,
      {String name = "Член",
      String email = "xyu@123",
      String pswd = "sdf"}) async {
    var url = Uri.parse('https://smmon.slata.com/getOrder/go.php');

    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(join(await getDatabasesPath(), 'tokens.db'),
        version: 1, onCreate: (db, version) {
      return db.execute(
        "create table token (uid text primary key, ukmid text);",
      );
    });
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("token");

    var token = List.generate(maps.length, (index) {
      return DataToken(uid: maps[index]["uid"], ukmid: "");
    });
    print("LENGTH ${token.length}");
    var tt;
    if (token.length > 0) {
      print("EL ${token[0].uid}");
      tt = token[0].uid;
    }
    var response = await http.post(url,
        body:
            '{"token":"jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "aecd49c9-70c3-4aef-8c68-ce5bc54005ad","name": "$name","card": "123124","email": "$email", "password": "$pswd", "enter": "check", "tt": "$tt"}');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.body == tt) {
      return true;
    } else {
      return false;
    }
  }
}

class DataToken {
  final String uid;
  final String ukmid;

  const DataToken({required this.uid, required this.ukmid});

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'ukmid': ukmid};
  }

  @override
  String toString() {
    return "DataToken{uid: $uid, ukmid: $ukmid}";
  }
}
