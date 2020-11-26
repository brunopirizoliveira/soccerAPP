import 'package:flutter/material.dart';

class Transferencias extends StatelessWidget {

  int id;
  int nome;

  Transferencias({Key key, this.id, this.nome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Thiago Maia'),
          subtitle: Text('Lille -> Flamengo'),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Pedro'),
          subtitle: Text('Fiorentina -> Flamengo'),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Fred'),
          subtitle: Text('Cruzeiro -> Fluminense'),
        ),
      ],
    );
  }
}