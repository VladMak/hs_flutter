import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/views/Contacts.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/Cabinet.dart';
import 'package:myapp/views/LoginSignupPage.dart';
import 'package:myapp/views/Sales.dart';
import 'package:myapp/models/Api.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'ProgressItem.dart';

class BottomNavBarMenu extends StatefulWidget {
  BottomNavBarMenu(
      {Key? key, required Queue<BuildContext> queue, required this.updateTitle})
      : super(key: key) {
    _queue = queue;
  }

  late Queue<BuildContext> _queue;
  final ValueChanged<String?> updateTitle;

  @override
  State<BottomNavBarMenu> createState() => BottomNavBarMenuState();
}

class BottomNavBarMenuState extends State<BottomNavBarMenu> {
  Screen _currentScreenId = Screen.Home;

  Queue<BuildContext> getQueue() {
    return widget._queue;
  }

  void selectItem(Screen id) {
    setState(() {
      _currentScreenId = id;
    });
  }

  void _changeScreenId(Screen id) async {
    setState(() {
      selectItem(id);
    });
    switch (id) {
      case Screen.Home:
        if (widget._queue.isNotEmpty) {
          Navigator.pushAndRemoveUntil(
              keyFragmentBody.currentState?.getContext() as BuildContext,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
              (route) => true);
          widget._queue.clear();
          widget.updateTitle(screenTitles[Screen.Home]);
        }
        break;
      case Screen.Sales:
        if (widget._queue.isNotEmpty) {
          Navigator.of(widget._queue.removeLast()).pushReplacement(
              MaterialPageRoute(builder: (context) => Sales()));
        } else {
          Navigator.of(
                  keyFragmentBody.currentState?.getContext() as BuildContext)
              .push(MaterialPageRoute(builder: (context) => Sales()));
        }
        widget._queue.addLast(
            keyFragmentBody.currentState?.getContext() as BuildContext);
        widget.updateTitle(screenTitles[Screen.Sales]);
        break;
      case Screen.Contacts:
        if (widget._queue.isNotEmpty) {
          Navigator.of(widget._queue.removeLast()).pushReplacement(
              MaterialPageRoute(builder: (context) => Contacts()));
        } else {
          Navigator.of(
                  keyFragmentBody.currentState?.getContext() as BuildContext)
              .push(MaterialPageRoute(builder: (context) => Contacts()));
        }
        widget._queue.addLast(
            keyFragmentBody.currentState?.getContext() as BuildContext);
        widget.updateTitle(screenTitles[Screen.Contacts]);
        break;
      case Screen.Cabinet:
        Navigator.of(keyFragmentBody.currentState!.context).push(
            PageRouteBuilder(
                pageBuilder: (context, _, __) => ProgressItem(),
                opaque: false));

        var api = Api();
        var login = await api.checkToken();

        Navigator.of(keyFragmentBody.currentState!.context).pop();
        if (widget._queue.isNotEmpty) {
          if (login) {
            Navigator.of(widget._queue.removeLast()).pushReplacement(
                MaterialPageRoute(builder: (context) => Cabinet()));
          } else {
            Navigator.of(widget._queue.removeLast()).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => LoginSignupPage(
                        queue: widget._queue,
                        updateTitle: widget.updateTitle)));
          }
        } else {
          if (login) {
            Navigator.of(
                    keyFragmentBody.currentState?.getContext() as BuildContext)
                .push(MaterialPageRoute(builder: (context) => Cabinet()));
          } else {
            Navigator.of(
                    keyFragmentBody.currentState?.getContext() as BuildContext)
                .push(MaterialPageRoute(
                    builder: (context) => LoginSignupPage(
                        queue: widget._queue,
                        updateTitle: widget.updateTitle)));
          }
        }
        if (login) {
          widget._queue.addLast(
              keyFragmentBody.currentState?.getContext() as BuildContext);
          widget.updateTitle(screenTitles[Screen.Cabinet]);
        } else {
          widget._queue.addLast(
              keyFragmentBody.currentState?.getContext() as BuildContext);
          widget.updateTitle(screenTitles[Screen.Signup]);
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Главная"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Поиск"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
            ),
            label: "Информация"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Кабинет"),
      ],
      selectedItemColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
      unselectedItemColor: Colors.black,
      onTap: (index) => _changeScreenId(Screen.values[index]),
      currentIndex: _currentScreenId.index,
    );
  }
}
