import 'package:flutter/material.dart';
import 'package:futebol/models/tweet.dart';

class CardTweet extends StatefulWidget {
  final Tweet tweet;

  CardTweet({this.tweet});

  @override
  _CardTweetState createState() => _CardTweetState();
}

class _CardTweetState extends State<CardTweet> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(widget.tweet.mainImage),
          ListTile(
            title: Text(widget.tweet.tweetText),
            subtitle: Text(widget.tweet.author),
          ),
        ],
      ),
    );
  }
}
