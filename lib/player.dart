// ignore_for_file: prefer_typing_uninitialized_variables, duplicate_ignore

import 'package:flutter/material.dart';

// ignore: duplicate_ignore
class MyPlayer extends StatelessWidget {
  final playerX;
  // ignore: prefer_typing_uninitialized_variables
  final playerWidth;
  const MyPlayer({super.key,
  this.playerX,
  this.playerWidth});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment((2 * playerX + playerWidth)/(2-playerWidth), 0.9),
        child: Container(
          height: 10,
          width: MediaQuery.of(context).size.width*playerWidth/2,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
