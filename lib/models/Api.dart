import 'package:http/http.dart' as http;
import 'package:myapp/models/Db.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Api {
  Future<void> registration(
      {String name = "Член",
      String email = "xyu@123",
      String pswd = "sdf"}) async {
    // законнектились к локальному хранилищу токена
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(join(await getDatabasesPath(), 'tokens.db'),
        onCreate: (db, version) {
      return db.execute(
        "create table token (uid text primary text);",
      );
    });

    // генерим ЮИД
    var uuid = Uuid();
    uuid.v4();

    var url = Uri.parse('https://smmon.slata.com/getOrder/go.php');
    // делаем запрос к удаленному хосту, к бд там.
    var response = await http.post(url,
        body:
            '{"token":"jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "$uuid","name": "$name","card": "123124","email": "$email", "password": "$pswd", "enter": false}');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //db.insertToken(DataToken(uid: response.body));
    var token = DataToken(uid: response.body);
    final db = await database;
    await db.insert("token", token.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    //print(db.getToken());
    //print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }

  Future<void> login(
      {String name = "Член",
      String email = "xyu@123",
      String pswd = "sdf"}) async {
    var url = Uri.parse('https://smmon.slata.com/getOrder/go.php');

    var response = await http.post(url,
        body:
            '{"token":"jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "aecd49c9-70c3-4aef-8c68-ce5bc54005ad","name": "$name","card": "123124","email": "$email", "password": "$pswd", "enter": true}');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }
}

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
