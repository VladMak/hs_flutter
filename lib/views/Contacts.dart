import 'package:flutter/material.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

/*class Contacts extends StatelessWidget {
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

final Uri _url = Uri.parse('https://t.me/hleb_sol');
final Uri _url2 = Uri.parse('https://vk.com/hlebsol38');

class Contacts extends StatelessWidget {
  const Contacts({
    Key? key,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_url';
    }
  }

  Future<void> _launchUrl2() async {
    if (!await launchUrl(_url2, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_url2';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
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
                        child: GestureDetector(
                            child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          child: Text("Обратная связь",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          onTap: () async {
                            var url = Uri.parse("https://hlebsol.taplink.ws");
                            if (await canLaunchUrl(url)) await launchUrl(url);
                          },
                        )),
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
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        child: Row(children: [
                          GestureDetector(
                            child: Image(
                                image: AssetImage("assets/Logo.png"),
                                width: 40),
                            onTap: _launchUrl,
                          )
                        ]),
                        width: 300,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        child: Row(children: [
                          GestureDetector(
                            child: Image(
                              image: AssetImage("assets/VK_Compact_Logo.png"),
                              width: 40,
                            ),
                            onTap: _launchUrl2,
                          )
                        ]),
                        width: 300,
                      ),
                    )),
              ],
            )
          ],
        ));
  }
}
