import 'package:flutter/material.dart';

class Campeonato extends StatefulWidget {
  Campeonato({Key key, this.id, this.nome}) : super(key: key);

  final int id;
  final String nome;

  @override
  _CampeonatoState createState() => _CampeonatoState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CampeonatoState extends State<Campeonato> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'Tabela',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Artilheiros',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Transferências',
        style: optionStyle,
      ),
    ),
  ];

  List<StatelessWidget> _listArea = <StatelessWidget>[
    Tabela(),
    Artilheiros(),
    Transferencias(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nome),
      ),
      body: Container(
        child: _listArea.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_outlined),
            label: 'Tabela',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Artilhieros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows_rounded),
            label: 'Transferências',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class Tabela extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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

class Artilheiros extends StatelessWidget {

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

class Transferencias extends StatelessWidget {

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