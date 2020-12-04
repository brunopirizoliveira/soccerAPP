import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futebol/components/card_tweet.dart';
import 'package:futebol/components/menu_drawer.dart';
import 'package:futebol/models/campeonatos.dart';
import 'package:futebol/models/tweet.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:futebol/components/progress.dart';
import 'package:futebol/components/centered_message.dart';
import 'package:futebol/components/card_campeonato.dart';

class Tweets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      drawer: MenuDrawer(),
      body: FutureBuilder<List<Tweet>>(
          future:
              Future.delayed(Duration(seconds: 3)).then((value) => findAll()),
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
                  final List<Tweet> TweetList = snapshot.data;
                  //debugPrint(CampeonatoList.toString());
                  if (TweetList.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: TweetList.length,
                      itemBuilder: (context, index) {
                        final Tweet tweet = TweetList[index];
                        return CardTweet(tweet: tweet);
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
          }),
    );
  }

  Future<List<Tweet>> findAll() async {
    final Response response = await get(
      'https://api.twitter.com/2/tweets/search/recent?query=%23tottenham&tweet.fields=author_id,created_at,entities,geo,in_reply_to_user_id,lang,possibly_sensitive,referenced_tweets,source',
      headers: {
        HttpHeaders.authorizationHeader:
            "Bearer AAAAAAAAAAAAAAAAAAAAANHHKAEAAAAAyoPiDYTZuWsyy%2Bzyi30B8Rl9YiU%3DOdMfqFJbqYl93nkmN4PAhEdPGi3PeoTBeRXEuNZSXN82Ih45mV"
      },
    ).timeout(
      Duration(seconds: 15),
    );
    //debugPrint(response.body);
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    List<dynamic> listTweets = decodedJson['data'];

    final List<Tweet> list = new List();

    for (Map<String, dynamic> element in listTweets) {
      String tweetImage = "";
      try {
        tweetImage = element['entities']['urls'][0]['images'][0]['url'];
      } catch(Exception) {
        //
      }
      if(tweetImage == "")
        tweetImage = "https://merriam-webster.com/assets/mw/images/article/art-wap-article-main/egg-3442-e1f6463624338504cd021bf23aef8441@1x.jpg";

      list.add(
        Tweet(author: element['author_id'], tweetText: element['text'], mainImage: tweetImage),
      );
    }

    return list;
  }
}
