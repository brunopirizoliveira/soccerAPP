import 'dart:math';

import 'package:flutter/material.dart';
import 'package:futebol/models/partidas.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardPartida extends StatelessWidget {
  final Partida _partida;

  CardPartida(this._partida);

  @override
  Widget build(BuildContext context) {
    // Logo Mandante usando lib de SVG
    final Widget logoMandante = SvgPicture.network(
      _partida.mandante.escudo,
      height: 80.0,
      width: 40.0,
      semanticsLabel: _partida.mandante.nome,
      placeholderBuilder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(4.0),
        child: const CircularProgressIndicator(),
      ),
    );

    // Logo Visitante usando lib de SVG
    final Widget logoVisitante = SvgPicture.network(
      _partida.visitante.escudo,
      height: 80.0,
      width: 40.0,
      semanticsLabel: _partida.visitante.nome,
      placeholderBuilder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(4.0),
        child: const CircularProgressIndicator(),
      ),
    );

    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: ListTile(
                leading: logoMandante,
                title: Text(_partida.placar_mandante.toString()),
                subtitle: Text(_partida.mandante.nome),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: ListTile(
                leading: logoVisitante,
                title: Text(_partida.placar_visitante.toString()),
                subtitle: Text(_partida.visitante.nome),
              ),
            ),
          ),
        ],

      ),
    );
  }
}
