import 'package:flutter/material.dart';

class LoserPage extends StatelessWidget {
  const LoserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Over'),
      ),
      body: Center(
        child: Text('Sorry, you could not guess the number within 3 chances'),
      ),
    );
  }
}
