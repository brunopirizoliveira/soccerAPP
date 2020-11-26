import 'package:flutter/material.dart';

class Progress extends StatelessWidget {

  final String message;
  Progress({this.message="Loading"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Loading....',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
