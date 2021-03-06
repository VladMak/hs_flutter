import 'package:flutter/material.dart';
import 'package:barcode/barcode.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:myapp/main.dart';
import 'package:myapp/views/Coupons.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/PersonalDataProtection.dart';
import 'package:myapp/views/ProfileEdit.dart';
import 'package:myapp/views/PurchaseHistory.dart';
import 'package:myapp/views/UserAgreement.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

/*class Cabinet extends StatefulWidget {
  const Cabinet({Key? key}) : super(key: key);

  @override
  State<Cabinet> createState() => _CabinetState();
}

class _CabinetState extends State<Cabinet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Кабинет",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
      ),
      drawer: DrawerMenu(),
      body: CabinetView(),
      //bottomNavigationBar: BottomNavBarMenu(),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: SizedBox(
          width: 80,
          child: FloatingActionButton(
            onPressed: () {},
            child: Image(
              image: AssetImage('assets/virtcard.png'),
            ),
            backgroundColor: Colors.white.withOpacity(0),
            elevation: 0,
            hoverColor: Colors.white.withOpacity(0),
            hoverElevation: 0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}*/

class Cabinet extends StatelessWidget {
  const Cabinet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Column(
            children: [VirtualCard()],
          )
        ],
      ),
    );
  }
}

class VirtualCard extends StatelessWidget {
  const VirtualCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Image(image: AssetImage("assets/virtcard.png")),
          ),
          Padding(
            child: BarcodeWidget(
              data: "1234567890123456", // Тут штрих код
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
                    "Владелец: Макаров В. А.",
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
                    "Номер: 1234567890123456",
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
                    "ШК: 1234567890123456",
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
                        keyFragmentBody.currentContext as BuildContext,
                        MaterialPageRoute(builder: (context) => MyCoupons()));
                  },
                  child: Text("Мои купоны"),
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                    return Color.fromARGB(0xFF, 0xB3, 0x19, 0x18); //#b31918
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
                        keyFragmentBody.currentContext as BuildContext,
                        MaterialPageRoute(builder: (context) => ProfileEdit()));
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
                    Navigator.push(
                        keyFragmentBody.currentContext as BuildContext,
                        MaterialPageRoute(
                            builder: (context) => PersonalDataProtection()));
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
                        keyFragmentBody.currentContext as BuildContext,
                        MaterialPageRoute(
                            builder: (context) => MyPurchaseHistory()));
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
                    Navigator.push(
                        keyFragmentBody.currentContext as BuildContext,
                        MaterialPageRoute(
                            builder: (context) => UserAgreement()));
                  },
                  child: Text("Пользовательское соглашение"),
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
                    WidgetsFlutterBinding.ensureInitialized();
                    final database = openDatabase(
                        join(await getDatabasesPath(), 'tokens.db'),
                        version: 1, onCreate: (db, version) {
                      return db.execute(
                        "create table token (uid text primary key);",
                      );
                    });
                    final db = await database;
                    db.execute("delete from token;");
                    Navigator.pushAndRemoveUntil(
                      keyFragmentBody.currentState?.getContext() as BuildContext,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                      (route) => true);
                    keyNavBar.currentState?.getQueue().clear();
                    keyNavBar.currentState?.widget.updateTitle(screenTitles[Screen.Home]);
                    keyNavBar.currentState!.selectItem(Screen.Home);
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
    );
  }
}
