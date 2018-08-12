import 'package:flutter/material.dart';

import 'AppNavigator.dart';
import 'ShoppingCartPage.dart';

void main() {
  AppNavigator.init();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "ShoppingApp",
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new ShoppingCartPage(),
    );
  }
}
