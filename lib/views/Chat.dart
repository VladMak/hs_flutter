import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/contollers/BottomNavBarMenu.dart';
import 'package:myapp/contollers/DrawerMenu.dart';
import 'package:myapp/domain/App.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
            "Чат",
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
        body: ListView(
          children: [Row()],
        ),
        /*Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                color: Colors.black,
                width: 400,
                child: Text("2"),
              ),
              Container(
                padding: EdgeInsets.all(15),
                color: Colors.amber,
                width: 400,
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: IntrinsicHeight(
                  child: SizedBox(
                      width: 400,
                      height: 400,
                      child: Row(children: [
                        Container(
                          child: TextFormField(
                              //controller: _numberController,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "Введите текст сообщения")),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.send,
                            color: Colors.pink,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(1, 0, 0, 0),
                              elevation: 0),
                        )
                      ])),
                ),
              )
            ],
          ),
        ),*/
        // Нижний навбар
        bottomNavigationBar: BottomNavBarMenu(),
      ),
      routes: app.Routes,
    );
  }
}
