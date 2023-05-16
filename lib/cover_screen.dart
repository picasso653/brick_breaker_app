import 'package:flutter/material.dart';

class CoverScreen extends StatelessWidget {
  final bool gameStarted;
  const CoverScreen({super.key, required this.gameStarted});

  @override
  Widget build(BuildContext context) {
    return gameStarted? Container(): Container(
      alignment: const Alignment(0, -0.1),
      child: Text(
        'Tap to play',
        style: TextStyle(color: Colors.deepPurple[400]),
      ),
    );
  }
}
