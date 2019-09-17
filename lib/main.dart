import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {

  print("route-get:"+route);

  switch(route) {
    case "a_routerf":

      return PageAWidget();

    case "b_routerf":

      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.deepPurpleAccent,
          body: Center(
            child: Text(
              'Hello from Flutter----page   B',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red,
              ),
            ),
          ),
        ),
      );

    default:
      return DefaultWidget();
  }
}

class PageAWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text(
            'Hello from Flutter----Page  A',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.yellow,
            ),
          ),
        ),
      ),
    );
  }

}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        body: Center(
          child: Text(
            'Hello from Flutter----default',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.cyanAccent,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PageAWidget())),
          tooltip: 'ToPageA',
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }

}
