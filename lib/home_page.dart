import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double ballX = 0;
  double ballY = 0;

  void startGame() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        ballY -= 0.01;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      child: Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        body: Center(
          child: Stack(
            children: [
              // tap to play
              Container(
                alignment: Alignment(0, -0.2),
                child: Text('Tap to play', style: TextStyle(color: Colors.deepPurple[400]),),
              ),
              // ball
              Container(
                alignment: const Alignment(0, 0),
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple, shape: BoxShape.circle),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
