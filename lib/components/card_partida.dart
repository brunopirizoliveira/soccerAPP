import 'package:flutter/material.dart';
import 'package:futebol/screens/campeonato.dart';
import 'package:futebol/models/partidas.dart';

class CardPartida extends StatelessWidget {

  final Partida _partida;

  CardPartida(this._partida);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.sports_soccer),
        title: Text(_partida.placar),
        subtitle: Text(_partida.estadio.nome),
      ),
    );

  }
}
