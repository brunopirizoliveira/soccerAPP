import 'package:flutter/material.dart';
import 'package:futebol/models/partidas.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

class Tabela extends StatelessWidget {

  int id;
  int nome;

  Tabela({Key key, this.id, this.nome}) : super(key: key);

  Future<List<Partidas>> buscaPartidas() async {
    final Response response = await get(
      'https://api.api-futebol.com.br/v1/times/1/partidas/proximas',
      headers: {
        HttpHeaders.authorizationHeader:
        "Bearer test_00b8645af0e536fe3aebbc19a2d332"
      },
    ).timeout(
      Duration(seconds: 15),
    );
    debugPrint(response.body);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Partidas> list = new List();
    debugPrint(response.body);
    for (Map<String, dynamic> element in decodedJson) {
      list.add(
          Partidas(id: element['campeonato_id'],));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    if (id == 2) {
      return FutureBuilder<List<Partidas>>(
          future: Future.delayed(Duration(seconds: 3)).then((value) =>
              buscaPartidas()),
          builder: null
      );
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