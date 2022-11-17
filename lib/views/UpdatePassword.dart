import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/drivers/reset_password.dart';
import 'package:myapp/views/LoginSignupPage.dart';

class UpdatePassword extends StatefulWidget {
  String? email;
  UpdatePassword({required String email}) {
    this.email = email;
  }

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState(email);
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final _password = TextEditingController();
  String? _email;
  var isVisible = false;

  void showToast() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  _UpdatePasswordState(String? email) {
    this._email = email;
  }

  @override
  void dispose() {
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              actions: [
                Container(
                  child: Image(image: AssetImage("assets/logo.png")),
                  padding: EdgeInsets.all(5),
                )
              ],
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                "Восстановление пароля",
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
            body: Container(
              padding: EdgeInsets.all(15),
              child: ListView(children: [
                Container(
                    child: TextFormField(
                        controller: _password,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Введите новый пароль"))),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      updatePassword(email: _email, password: _password.text)
                          .then((value) {
                        print("STATUS: {$value}");
                        showToast();
                      });
                    },
                    child: Text(
                      "Обновить пароль",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(1, 0, 0, 0), elevation: 0),
                  ),
                ),
                Visibility(
                    visible: isVisible,
                    child: Container(
                      child: ElevatedButton(
                        child: Text("Пароль изменен! Войти."),
                        onPressed: () {
                          Route route = MaterialPageRoute(
                            builder: (context) => LoginSignupPage(),
                          );
                          Navigator.push(context, route);
                        },
                      ),
                    ))
              ]),
            )));
  }
}
