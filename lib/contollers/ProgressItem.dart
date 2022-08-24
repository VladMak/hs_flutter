import 'package:flutter/material.dart';

class ProgressItem extends StatelessWidget {
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Center(
            child: Container(
                color: Color.fromARGB(100, 0, 0, 0),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 200),
                child: Center(
                  child: CircularProgressIndicator(
                      color: Color.fromARGB(0xFF, 0xB3, 0x19, 0x18)),
                ))),
        onWillPop: () async {
          return false;
        });
  }
}
