class Time {

  final int id;
  final String nome;
  final String escudo;

  Time({this.id, this.nome, this.escudo});

  @override
  String toString() {
    return 'Time{id: $id, nome: $nome}';
  }

}