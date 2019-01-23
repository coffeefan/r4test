import 'package:flutter/material.dart';
import 'screens/products/index.dart';
import 'screens/home/index.dart';
import 'screens/insider/index.dart';


class Routes {
  final routes = <String, WidgetBuilder>{
  '/products': (BuildContext context) => new ProductScreen(title:'Products')
  };

  Routes () {
    runApp(new MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      theme: ThemeData(
        fontFamily: 'Roboto',

        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Colors.yellow,
      ),
      home: new LoginScreen()
    ));
  }
}