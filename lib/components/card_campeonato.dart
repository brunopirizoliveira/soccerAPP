import 'package:flutter/material.dart';
import 'package:futebol/screens/campeonato.dart';

class CardCampeonato extends StatelessWidget {

  final int _idCampeonato;
  final String _nomeCampeonato;

  CardCampeonato(this._idCampeonato, this._nomeCampeonato);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Campeonato(id: _idCampeonato, nome: _nomeCampeonato)));
      },
      child: Card(
        child: ListTile(
          leading: Icon(Icons.sports_soccer),
          title: Text(_nomeCampeonato),
          subtitle: Text(_idCampeonato.toString()),
        ),
      ),
    );
  }
}
