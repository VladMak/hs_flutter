import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/domain/App.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:convert';

import 'dart:convert';

class Api {
  Future<List<int>> getImage() async {
    var url = Uri.parse(
        'http://45.141.102.186:8000/1d526c23-4ddf-4502-9a63-c04d7f330c8b_0.576c78aa695f9');
    var response = await http.get(url);

    List<int> bytes = utf8.encode(response.body);

    return bytes;
  }

  Future<String> registration(
      {String name = "Член",
      String email = "xyu@123",
      String pswd = "sdf",
      String firstname = "",
      String secondname = "",
      String surname = ""}) async {
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

    var newbody =
        '{"token": "jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "0","name": "$name","card": "0","email": "$email","password": "$pswd","enter": "reg","userToken": "0eedc517-da6d-4d28-bc6e-9e026d348a71","level": 0,"nextLevel": 0,"sumShop": 0.0,"countBonus": 0.0, "firstname": "$firstname", "secondname": "$secondname", "surname": "$surname"}';
    // делаем запрос к удаленному хосту, к бд там.
    var response = await http.post(url, body: newbody);
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

    bool lgn = await login(name: name, email: email, pswd: pswd);

    return response.body;
    //print(db.getToken());
    //print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }

  Future<bool> login(
      {String name = "Член",
      String email = "xyu@123",
      String pswd = "sdf"}) async {
    var url = Uri.parse('https://smmon.slata.com/getOrder/go.php');

    var newbody =
        '{"token": "jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "0","name": "$name","card": "0","email": "$email","password": "$pswd","enter": "login","userToken": "0eedc517-da6d-4d28-bc6e-9e026d348a71","level": 0,"nextLevel": 0,"sumShop": 0.0,"countBonus": 0.0}';
    print("LOGIN: $newbody");
    var response = await http.post(url, body: newbody);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (jsonDecode(response.body) == "не вышло") {
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
    await db.execute(
      "delete from token;",
    );
    await db.insert("token", token.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return true;
    //print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }

  Future<bool> checkToken(
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

    var newbody =
        '{"token": "jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "0","name": "$name","card": "0","email": "$email","password": "$pswd","enter": "check","userToken": $tt,"level": 0,"nextLevel": 0,"sumShop": 0.0,"countBonus": 0.0}';
    var response = await http.post(url, body: newbody);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.body == tt) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> GetUserData() async {
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
      print("EL ${token[0].uid} - $token");
      tt = token[0].uid;
    }

    var newbody =
        '{"token": "jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns","id": "0","name": "S","card": "0","email": "S","password": "S","enter": "userdata","userToken": $tt,"level": 0,"nextLevel": 0,"sumShop": 0.0,"countBonus": 0.0}';
    print("REQUEST $newbody");
    var response = await http.post(url, body: newbody);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response.body;
  }

  Future<List<String>?> GetCouponsList(bool public) async {
    var url = Uri.parse('https://smmon.slata.com/getOrder/go.php');

    var newbody = '''{
          "token": "jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns",
          "id": "0",
          "name": "Vlad233",
          "card": "0",
          "email": "mavlsion@mail.ru",
          "password": "testing",
          "enter": "couponslist",
          "userToken": "e98876cd-52a0-4117-87ef-6e61f9ae7422",
          "level": 0,
          "nextLevel": 0,
          "sumShop": 0.0,
          "countBonus": 0.0,
          "firstname": "Vladislav",
          "secondname": "Makarov",
          "surname": "Alexandrovich"
      }''';

    print("REQUEST $newbody");
    var response = await http.post(url, body: newbody);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200) throw Exception("Ошибка");

    List<String> data = List.from(jsonDecode(response.body));
    return data;
  }

  Future<Widget> GetCoupons(BuildContext context, App app) async {
    try {
      var url = Uri.parse('https://smmon.slata.com/getOrder/go.php');

      var newbody = '''{
          "token": "jQw62fyzVbsmMzRGjhfsdgy67ashqyHyfgAGSQHSFXNXHASDFKL8fsd6sHSADFfsdns",
          "id": "0",
          "name": "Vlad233",
          "card": "0",
          "email": "mavlsion@mail.ru",
          "password": "testing",
          "enter": "couponslist",
          "userToken": "e98876cd-52a0-4117-87ef-6e61f9ae7422",
          "level": 0,
          "nextLevel": 0,
          "sumShop": 0.0,
          "countBonus": 0.0,
          "firstname": "Vladislav",
          "secondname": "Makarov",
          "surname": "Alexandrovich"
      }''';

      print("REQUEST $newbody");
      var response = await http.post(url, body: newbody);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode != 200) throw Exception("Ошибка");

      var data = List.from(jsonDecode(response.body));

      if (data.length < 1) {
        return Center(
          child: Text("Не найдено доступных купонов",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        );
      } else {
        List<Widget> coupons = [];

        for (var coupon in data) {
          coupons.add(GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Image.network(
                "https://smmon.slata.com/getOrder/" + "img/" + coupon,
                errorBuilder: (context, obj, trace) =>
                    Text("Купон не загружен"),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                      color: Colors.white,
                      child: Center(
                          child: Container(
                              color: Colors.white,
                              height: 45,
                              width: 45,
                              child: CircularProgressIndicator(
                                  color: Color.fromARGB(
                                      0xFF, 0xB3, 0x19, 0x18)))));
                },
              ),
            ),
            onTap: () {
              print("TAPPED: $coupon");
              app.CouponId = coupon;
              Navigator.pushNamedAndRemoveUntil(
                  context, '/couponItem', (route) => false,
                  arguments: app);
            },
          ));
        }
        return ListView(children: coupons);
      }
    } catch (ex) {
      return Center(
        child: Text("При загрузке купонов произошла ошибка",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      );
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
