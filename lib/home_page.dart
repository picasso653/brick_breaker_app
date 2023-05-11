import 'dart:async';

import 'package:brick_breaker_app/ball.dart';
import 'package:brick_breaker_app/cover_screen.dart';
import 'package:brick_breaker_app/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// ignore: constant_identifier_names
enum direction { UP, DOWN }

class _HomePageState extends State<HomePage> {
  double ballX = 0;
  double ballY = 0;
  double playerX = 0;
  double playerWidth = 0.3;
  bool gameStarted = false;
  var balldirection = direction.DOWN;

  void startGame() {
    gameStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      updateDirection();
      moveBall();
    });
  }

  void moveBall() {
    if (balldirection == direction.DOWN) {
      ballY += 0.01;
    } else if (balldirection == direction.UP) {
      ballY -= 0.01;
    }
  }

  void updateDirection() {
    setState(() {
      if (ballY >= 0.9) {
      balldirection = direction.UP;
    } else if (ballY <= -0.9) {
      balldirection = direction.DOWN;
    }
    });
  }

  void moveLeft() {
    setState(() {
      if (!(playerX - 0.2 <= -1)) {
        playerX -= 0.2;
      }
    });
  }

  void moveRight() {
    setState(() {
      if (!(playerX + playerWidth >= 1)) {
        playerX += 0.2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveLeft();
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveRight();
        }
      },
      child: GestureDetector(
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
                // ball for test
                MyBall(
                  ballX: ballX,
                  ballY: ballY,
                ),

                // player
                MyPlayer(
                  playerX: playerX,
                  playerWidth: playerWidth,
                ),
                // Where is player exactly
                Container(
                  alignment: Alignment(playerX, 0.9),
                  child: Container(
                    color: Colors.red,
                    width: 4,
                    height: 15,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
