import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futebol/models/campeonatos.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:futebol/components/progress.dart';
import 'package:futebol/components/centered_message.dart';
import 'package:futebol/components/card_campeonato.dart';

class Secoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Campeonatos>>(
        future: Future.delayed(Duration(seconds: 3)).then((value) => findAll()),
        // future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;

            case ConnectionState.waiting:
              Progress(
                message: "Carregando Campeonatos",
              );
              break;

            case ConnectionState.active:
              break;

            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Campeonatos> CampeonatoList = snapshot.data;
                //debugPrint(CampeonatoList.toString());
                if (CampeonatoList.isNotEmpty) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: CampeonatoList.length,
                    itemBuilder: (context, index) {
                      final Campeonatos campeonato = CampeonatoList[index];
                      return CardCampeonato(campeonato.id, campeonato.nome);
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
            message: "Carregando Campeonatos",
          );
        });
  }

  Future<List<Campeonatos>> findAll() async {
    final Response response = await get(
      'https://api.api-futebol.com.br/v1/campeonatos',
      headers: {
        HttpHeaders.authorizationHeader:
            "Bearer test_00b8645af0e536fe3aebbc19a2d332"
      },
    ).timeout(
      Duration(seconds: 15),
    );
    //debugPrint(response.body);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Campeonatos> list = new List();

    for (Map<String, dynamic> element in decodedJson) {
      list.add(
          Campeonatos(id: element['campeonato_id'], nome: element['nome']));
    }

    return list;
  }
}
