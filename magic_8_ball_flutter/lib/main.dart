import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  const BallPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text('Ask Me Anything'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blue.shade200,
          child: Ball(),
        ),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  Ball({Key key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int randomBallAnswer = 1;

  void getRandomBallAnswer() {
    setState(() {
      randomBallAnswer = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            getRandomBallAnswer();
          },
          child: Image.asset('images/ball$randomBallAnswer.png')),
    );
  }
}
