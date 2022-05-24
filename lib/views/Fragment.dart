import 'package:flutter/material.dart';
import 'package:myapp/views/Home.dart';

class Fragment extends StatefulWidget {
  Fragment({Key? key}) : super(key: key);

  @override
  State<Fragment> createState() => FragmentState();
}

class FragmentState extends State<Fragment> {
  late BuildContext _fragmentContext;

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
