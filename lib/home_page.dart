import 'dart:async';

import 'package:brick_breaker_app/ball.dart';
import 'package:brick_breaker_app/cover_screen.dart';
import 'package:brick_breaker_app/player.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double ballX = 0;
  double ballY = 0;
  double playerX = 0;
  double playerWidth = 0.3;
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
              // tap
              CoverScreen(
                gameStarted: gameStarted,
              ),
              // ball
               MyBall(
                ballX: ballX,
                ballY: ballY,
              ),

              // player
              MyPlayer(
                playerX: playerX,
                playerWidth: playerWidth,
              )
            ],
          ),
        ),
      ),
    );
  }
}
