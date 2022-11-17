import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/domain/App.dart';
import 'package:myapp/models/Api.dart';

class ProfileEdit2 extends StatefulWidget {
  const ProfileEdit2({Key? key}) : super(key: key);

  @override
  State<ProfileEdit2> createState() => _ProfileEdit2State();
}

Future<dynamic> getData() async {
  var api = new Api();
  var jsonInfo = await api.GetUserData();
  return jsonInfo;
}

class _ProfileEdit2State extends State<ProfileEdit2> {
  Future<dynamic> _myData = getData();
  var _nameController = TextEditingController(text: "Имя");
  var _emailController = TextEditingController(text: "Почта");
  var _lastNameController = TextEditingController(text: "Фамилия");
  var _surNameController = TextEditingController(text: "Отчество");

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _lastNameController.dispose();
    _surNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var app = new App();
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
            "Редактирование профиля",
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
        body: FutureBuilder(
          future: _myData,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var jsonFromStr = jsonDecode(snapshot.data as String);
              print(jsonFromStr);
              _nameController =
                  TextEditingController(text: jsonFromStr["firstname"]);
              _emailController =
                  TextEditingController(text: jsonFromStr["vusemail"]);
              _lastNameController =
                  TextEditingController(text: jsonFromStr["secondname"]);
              _surNameController =
                  TextEditingController(text: jsonFromStr["surname"]);
              return Container(
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Почта',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Имя',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Фамилия',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _surNameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Отчество',
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {
                            var api = Api();
                            api.UpdateUserData(
                                _nameController.text,
                                _lastNameController.text,
                                _surNameController.text,
                                _emailController.text);
                          },
                          child: Text(
                            "Обновить данные пользователя",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(1, 0, 0, 0),
                              elevation: 0),
                        )),
                  ],
                ),
              );
            } else {
              return Text("Идет загрузка...");
            }
          }),
        ),
        // Нижний навбар
        bottomNavigationBar: BottomNavBarMenu(),
      ),
      routes: app.Routes,
    );
  }
}
