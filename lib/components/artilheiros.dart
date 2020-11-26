import 'package:flutter/material.dart';

class Artilheiros extends StatelessWidget {

  int id;
  int nome;

  Artilheiros({Key key, this.id, this.nome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Jogador',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Clube',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Gols',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Gabigol')),
            DataCell(Text('Flamengo')),
            DataCell(Text('21')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Pedro')),
            DataCell(Text('Flamengo')),
            DataCell(Text('21')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('German Cano')),
            DataCell(Text('Vasco')),
            DataCell(Text('18')),
          ],
        ),
      ],
    );
  }
}