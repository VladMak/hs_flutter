import 'package:flutter/material.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/Cabinet.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10)),
    home: Home(),
  ));
}
