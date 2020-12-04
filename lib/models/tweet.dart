class Tweet {

  final String author;
  final String tweetText;
  final String mainImage;

  Tweet({this.author, this.tweetText, this.mainImage});

  @override
  String toString() {
    return 'Tweet{author: $author, tweet: $tweetText}';
  }

}