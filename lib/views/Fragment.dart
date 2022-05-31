import 'package:flutter/material.dart';
import 'package:myapp/views/Home.dart';

// Контейнер, в пределах которого будут показываться основные экраны
class Fragment extends StatefulWidget {
  Fragment({Key? key}) : super(key: key);

  @override
  State<Fragment> createState() => FragmentState();
}

class FragmentState extends State<Fragment> {
  // Поле для хранения контекста создания основных экранов
  late BuildContext _fragmentContext;

  // Метод для получения контекста создания основных экранов
  BuildContext getContext() {
    return _fragmentContext;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) {
          _fragmentContext = context;
          return Home();
        });
      },
    );
  }
}
