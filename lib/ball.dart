// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyBall extends StatefulWidget {
  final ballX;
  final ballY;


  const MyBall({super.key,
   this.ballX, 
   this.ballY});
  @override
  State<MyBall> createState() => _MyBallState();
}

class _MyBallState extends State<MyBall> {
  @override
  Widget build(BuildContext context) {
    return Container(
                alignment: const Alignment(0, 0),
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple, shape: BoxShape.circle),
                ),
              );
  }
}
