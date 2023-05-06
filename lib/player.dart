import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyPlayer extends StatelessWidget {
  final playerX;
  final playerWidth;
  const MyPlayer({super.key,
  this.playerX,
  this.playerWidth});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment(playerX, 0.9),
        child: Container(
          height: 10,
          width: MediaQuery.of(context).size.width*playerWidth/2,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
