import 'package:flutter/material.dart';
import 'package:futebol/components/secoes.dart';
import 'package:futebol/components/menu_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Futebol'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertCustom(),
            ),
          ),
        ],
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
