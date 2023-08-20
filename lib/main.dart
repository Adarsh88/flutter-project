import 'package:finalproject/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'screens/homepage_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Web',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
