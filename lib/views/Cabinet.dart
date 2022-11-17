import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:barcode/barcode.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/domain/App.dart';
import 'package:myapp/main.dart';
import 'package:myapp/views/MyCoupons.dart';
import 'package:myapp/views/PersonalDataProtection.dart';
import 'package:myapp/views/ProfileEdit.dart';
import 'package:myapp/views/ProfileEdit2.dart';
import 'package:myapp/views/PurchaseHistory.dart';
import 'package:myapp/views/UserAgreement.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import '../models/Api.dart';

class Cabinet extends StatefulWidget {
  const Cabinet({
    Key? key,
  }) : super(key: key);

  @override
  State<Cabinet> createState() {
    return VirtualCard();
  }
}

Future<dynamic> getData() async {
  var api = new Api();
  var jsonInfo = await api.GetUserData();
  return jsonInfo;
}

class VirtualCard extends State<Cabinet> {
  Future<dynamic> _myData = getData();

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    App app;
    if (settings.arguments == null) {
      app = new App();
    } else {
      app = settings.arguments as App;
    }
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Container(
            width: 100,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 45),
            child: FloatingActionButton(
              child: Image(
                image: AssetImage("assets/virtcard.png"),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/cabinet");
              },
              backgroundColor: Color.fromARGB(0, 0, 0, 0),
              elevation: 0,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          actions: [
            Container(
              child: Image(image: AssetImage("assets/logo.png")),
              padding: EdgeInsets.all(5),
            )
          ],
          leading: Builder(builder: (context) {
            return GestureDetector(
              child: Image(
                image: AssetImage('assets/icons/_-12.png'),
              ),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Кабинет",
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFFE51D08),
                    const Color(0xFFf2b11a),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
        ),
        // Боковое меню
        drawer: DrawerMenu(),
        // Контейнер, где будут показываться основные экраны
        //body: Fragment(key: keyFragmentBody),
        body: FutureBuilder(
            future: _myData,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                print("GOVNO ${snapshot.data.runtimeType}");
                print("GOVNO ${snapshot.data as String}");
                var jsonFromStr = jsonDecode(snapshot.data as String);
                return ListView(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child:
                              Image(image: AssetImage("assets/virtcard.png")),
                        ),
                        Padding(
                          child: BarcodeWidget(
                            data: "${jsonFromStr["vuscard"]}", // Тут штрих код
                            barcode: Barcode.code128(),
                            width: 300,
                            drawText: false,
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                child: Text(
                                  "Владелец: ${jsonFromStr["vusname"]}",
                                ),
                                width: 300,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                child: Text(
                                  "ФИО: ${jsonFromStr["secondname"]} ${jsonFromStr["firstname"]} ${jsonFromStr["surname"]}",
                                ),
                                width: 300,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                child: Text(
                                  "Номер: ${jsonFromStr["vuscard"]}",
                                ),
                                width: 300,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                child: Text(
                                  "ШК: ${jsonFromStr["vuscard"]}",
                                ),
                                width: 300,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                child: Text(
                                  "Ваша скида: " +
                                      (jsonFromStr["discount"] == null
                                          ? "0"
                                          : (double.parse(
                                                      jsonFromStr["discount"]) *
                                                  100)
                                              .toInt()
                                              .toString()) +
                                      "%",
                                ),
                                width: 300,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyCoupons()));
                                },
                                child: Text("Мои купоны"),
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                  return Color.fromARGB(
                                      0xFF, 0xB3, 0x19, 0x18); //#b31918
                                })),
                              ),
                              width: 300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: ElevatedButton(
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileEdit2()));
                                },
                                child: Text("Редактировать профиль"),
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                  return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
                                })),
                              ),
                              width: 300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, "/personalDataProtection",
                                      arguments: app);
                                  Navigator.push(
                                      keyFragmentBody.currentContext
                                          as BuildContext,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PersonalDataProtection()));
                                },
                                child: Text("Обработка перс. данных"),
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                  return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
                                })),
                              ),
                              width: 300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      keyFragmentBody.currentContext
                                          as BuildContext,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyPurchaseHistory()));
                                },
                                child: Text("История покупок"),
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                  return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
                                })),
                              ),
                              width: 300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, "/userAgreement");
                                },
                                child: Text("Соглашение об отказе чеков"),
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                  return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
                                })),
                              ),
                              width: 300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: ElevatedButton(
                                onPressed: () async {
                                  var url =
                                      Uri.parse("https://hlebsol.taplink.ws");
                                  if (await canLaunchUrl(url))
                                    await launchUrl(url,
                                        mode: LaunchMode.externalApplication);
                                },
                                child: Text("Обратная связь"),
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                  return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
                                })),
                              ),
                              width: 300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 60),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: ElevatedButton(
                                onPressed: () async {
                                  WidgetsFlutterBinding.ensureInitialized();
                                  final database = openDatabase(
                                      join(await getDatabasesPath(),
                                          'tokens.db'),
                                      version: 1, onCreate: (db, version) {
                                    return db.execute(
                                      "create table token (uid text primary key);",
                                    );
                                  });
                                  final db = await database;
                                  db.execute("delete from token;");
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/login', (route) => false);
                                },
                                child: Text("Выйти"),
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                  return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
                                })),
                              ),
                              width: 300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]);
              } else {
                return Center(
                  child: CircularProgressIndicator(
                      color: Color.fromARGB(0xFF, 0xB3, 0x19, 0x18)),
                );
              }
            })),
        // Нижний навбар
        bottomNavigationBar: BottomNavBarMenu(),
      ),
      routes: app.Routes,
    );
  }
}
