import 'package:flutter/material.dart';
import 'package:futebol/components/secoes.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Notícias'),
            ),
            ListTile(
              leading: Icon(Icons.live_tv),
              title: Text('Ao vivo'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today_rounded),
              title: Text('Calendário'),
            ),
          ],
        ),
      ),
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
