import 'package:flutter/material.dart';
import 'package:myapp/views/Cabinet.dart';

class FloatingBut extends StatefulWidget {
  const FloatingBut({Key? key}) : super(key: key);

  @override
  State<FloatingBut> createState() => _FloatingButState();
}

class _FloatingButState extends State<FloatingBut> {
  BuildContext? globContext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: SizedBox(
        width: 80,
        child: FloatingActionButton(
          onPressed: () {
            print("JOPA FROM FAB");
            Route route = MaterialPageRoute(
              builder: (context) => Cabinet(),
            );
            Navigator.push(context, route);
            //Navigator.pop(globContext!);
            //Navigator.push(globContext!,
            //    MaterialPageRoute(builder: (context) => const Cabinet()));
          },
          child: Image(
            image: AssetImage('assets/virtcard.png'),
          ),
          backgroundColor: Colors.white.withOpacity(0),
          elevation: 0,
          hoverColor: Colors.white.withOpacity(0),
          hoverElevation: 0,
        ),
      ),
    );
  }
}
