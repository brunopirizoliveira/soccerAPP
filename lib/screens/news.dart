import 'package:flutter/material.dart';
import 'package:futebol/components/secoes.dart';
import 'package:futebol/components/menu_drawer.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seções'),
      ),
      drawer: MenuDrawer(),
      body: ListView(
        children: [
          Secoes(),
        ],
      ),
    );
  }
}

class AlertCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AlertDialog(
        title: Text('Title'),
        content: Text('Teste'),
      ),
    );
  }
}
