import 'package:flutter/material.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myapp/contollers/FloatingBut.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Контакты",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
      ),
      drawer: DrawerMenu(),
      body: ContactsView(),
      bottomNavigationBar: BottomNavBarMenu(),
      floatingActionButton: FloatingBut(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ContactsView extends StatelessWidget {
  const ContactsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Image(image: AssetImage("assets/biglogo.png"))),
            Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Text(
                      "Адрес: г. Иркутск, ул. Безбокова 30/6",
                    ),
                    width: 300,
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Text("Сюда ссыль"),
                    width: 300,
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Text(
                      "Приемная e-mail: info@hlebsol.ru",
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
                      "Телефон: +7-395-248-08-01",
                    ),
                    width: 300,
                  ),
                )),
          ],
        )
      ],
    );
  }
}
