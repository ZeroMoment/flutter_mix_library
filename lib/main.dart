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
      home: DefaultPage(),
    );
  }

}

class DefaultPage extends StatefulWidget {
  @override
  _DefaultState createState() => _DefaultState();

}

class _DefaultState extends State<DefaultPage> with WidgetsBindingObserver {

  var clickNum = 0;

  @override
  void initState() {
    print("default page 创建....");
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("page statu: $state");
  }

  void _changeClickNum() {
    setState(() {
      ++clickNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Text(
          'default flutter page: $clickNum',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.cyanAccent,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeClickNum();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PageAWidget()));
        },
        //onPressed: ()=>,
        tooltip: 'ToPageA',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

}
