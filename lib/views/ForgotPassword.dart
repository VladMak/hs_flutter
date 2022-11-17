import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/drivers/reset_password.dart';
import 'package:myapp/views/UpdatePassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _numberController = TextEditingController();

    @override
    void dispose() {
      _nameController.dispose();
      _numberController.dispose();
      super.dispose();
    }

    var number = "";
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
            "Забыли пароль",
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
                controller: _nameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Введите вашу почту',
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  resetPassword(email: _nameController.text).then((value) {
                    number = value;
                  });
                },
                child: Text(
                  "Отправить код на почту",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(1, 0, 0, 0), elevation: 0),
              ),
            ),
            Container(
              child: TextFormField(
                  controller: _numberController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Введите пароль из почты")),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  print(" ${number} ${_numberController}");
                  if (number == _numberController.text) {
                    print("Совпали");
                    Route route = MaterialPageRoute(
                        builder: (context) =>
                            UpdatePassword(email: _nameController.text));
                    Navigator.pushAndRemoveUntil(
                        context, route, (route) => false);
                  } else {
                    print("err compare");
                  }
                },
                child: Text(
                  "Подтвердить пароль",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(1, 0, 0, 0), elevation: 0),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
