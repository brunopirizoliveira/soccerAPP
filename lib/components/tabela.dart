import 'package:flutter/material.dart';
import 'package:futebol/models/partidas.dart';
import 'package:futebol/models/estadio.dart';
import 'package:futebol/models/time.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';
import 'package:futebol/components/progress.dart';
import 'package:futebol/components/centered_message.dart';
import 'package:futebol/components/card_partida.dart';

class Tabela extends StatelessWidget {
  int id;
  int nome;

  Tabela({Key key, this.id, this.nome}) : super(key: key);

  Future<List<Partida>> buscaPartidas() async {
    final Response response = await get(
      'https://api.api-futebol.com.br/v1/times/1/partidas/proximas',
      headers: {
        HttpHeaders.authorizationHeader:
            "Bearer test_00b8645af0e536fe3aebbc19a2d332"
      },
    ).timeout(
      Duration(seconds: 15),
    );

    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    List<dynamic> partidas = decodedJson['copa-do-brasil'];

    final List<Partida> list = new List();

    for (Map<String, dynamic> partida in partidas) {
      list.add(
        Partida(
          id: partida['partida_id'],
          placar: partida['placar'],
          mandante: new Time(
            id: partida['time_mandante']['id'],
            nome: partida['time_mandante']['nome_popular'],
            escudo: partida['time_mandante']['escudo'],
          ),
          visitante: new Time(
            id: partida['time_visitante']['id'],
            nome: partida['time_visitante']['nome_popular'],
            escudo: partida['time_visitante']['escudo'],
          ),
          placar_mandante: partida['placar_mandante'],
          placar_visitante: partida['placar_visitante'],
          status: partida['status'],
          data_realizacao: partida['data_realizacao'],
          hora_realizacao: partida['hora_realizacao'],
          estadio: new Estadio(
            id: partida['estadio']['estadio_id'],
            nome: partida['estadio']['nome_popular'],
          ),
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    if (id == 2) {
      return FutureBuilder<List<Partida>>(
          future: Future.delayed(Duration(seconds: 3))
              .then((value) => buscaPartidas()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;

              case ConnectionState.waiting:
                Progress(
                  message: "Carregando partidas",
                );
                break;

              case ConnectionState.active:
                break;

              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<Partida> PartidaList = snapshot.data;
                  //debugPrint(CampeonatoList.toString());
                  if (PartidaList.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: PartidaList.length,
                      itemBuilder: (context, index) {
                        final Partida partida = PartidaList[index];
                        return CardPartida(partida);
                      },
                    );
                  }
                }

                return CenteredMessage(
                  message: "Nenhum campeonato encontrado",
                  iconData: Icons.warning,
                );

                break;
            }
            return Progress(
              message: "Carregando Partidas",
            );
          });
    } else {
      return DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Time',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Pontos',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Jogos',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Flamengo')),
              DataCell(Text('19')),
              DataCell(Text('21')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Vasco')),
              DataCell(Text('19')),
              DataCell(Text('21')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Botafogo')),
              DataCell(Text('19')),
              DataCell(Text('21')),
            ],
          ),
        ],
      );
    }
  }
}
