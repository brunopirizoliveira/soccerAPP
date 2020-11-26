import 'package:futebol/models/time.dart';
import 'package:futebol/models/estadio.dart';

class Partidas {
  final int id;
  final int partida_id;
  final String placar;
  final Time mandante;
  final Time visitante;
  final int placar_mandante;
  final int placar_visitante;
  final String status;
  final String data_realizacao;
  final String hora_realizacao;
  final Estadio estadio;

  Partidas({
    this.id,
    this.partida_id,
    this.placar,
    this.mandante,
    this.visitante,
    this.placar_mandante,
    this.placar_visitante,
    this.status,
    this.data_realizacao,
    this.hora_realizacao,
    this.estadio
  });

  @override
  String toString() {
    return 'Campeonatos{Placar: $placar}';
  }
}
