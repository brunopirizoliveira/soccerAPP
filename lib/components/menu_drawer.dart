import 'package:flutter/material.dart';
import 'package:futebol/screens/tweets.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Tweets()));
            },
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Notícias'),
            ),
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
    );
  }
}
