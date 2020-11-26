import 'package:flutter/material.dart';
import 'package:futebol/components/splash_page.dart';

void main() {
  runApp(Futebol());
}

class Futebol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}