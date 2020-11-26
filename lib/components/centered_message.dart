import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  final String message;
  final IconData iconData;

  CenteredMessage({this.message, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Column(
        children: <Widget>[
          Icon(iconData),
          Text(
            message,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
      visible: iconData != null,
    );
  }
}