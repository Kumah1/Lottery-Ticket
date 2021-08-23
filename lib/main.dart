import 'package:flutter/material.dart';
import 'package:lottery/Config/pallete.dart';
import 'package:lottery/navigations/BottomNavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOTTERY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: primaryColor,
        primarySwatch: primarySwatchColor,
      ),
      home: BottomNavBar(),
    );
  }
}
