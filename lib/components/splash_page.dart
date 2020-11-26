import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:futebol/screens/home.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            // Color(0xffED213A),
            // Color(0xff93291E)
            Colors.blueAccent,
            Colors.white54
          ],
        ),
        navigateAfterSeconds: Home(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bola.png"),
            fit: BoxFit.none,
          ),
        ),
      ),
    ],
  );
}