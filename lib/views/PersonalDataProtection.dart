import 'package:flutter/material.dart';

class PersonalDataProtection extends StatelessWidget {
  PersonalDataProtection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              title: Text(
                "Защита персональных данных",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
            ),
            body: Center(
              child: Text(
                "Здесь должен быть текст согласия об обработке персональных данных, но пока его нет:(",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
        onWillPop: () async {
          return true;
        });
  }
}
