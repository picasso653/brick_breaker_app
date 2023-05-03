import 'dart:async';

import 'package:brick_breaker_app/cover_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double ballX = 0;
  double ballY = 0;
  bool gameStarted = false;

  void startGame() {
    gameStarted = true;
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
              CoverScreen(
                gameStarted: gameStarted,
              ),
              // ball
              
            ],
          ),
        ),
      ),
    );
  }
}
