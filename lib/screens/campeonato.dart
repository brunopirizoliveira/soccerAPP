import 'package:flutter/material.dart';
import 'package:futebol/components/artilheiros.dart';
import 'package:futebol/components/tabela.dart';
import 'package:futebol/components/transferencias.dart';

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
  List<StatelessWidget> _listArea;

  @override
  void initState() {
    _listArea = <StatelessWidget>[
      Tabela(
        id: widget.id,
      ),
      Artilheiros(
        id: widget.id,
      ),
      Transferencias(
        id: widget.id,
      ),
    ];

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        child: _listArea[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_outlined),
            label: 'Tabela',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Artilheiros',
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
