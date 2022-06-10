import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        title: const Text('I Am Poor'),
        backgroundColor: Colors.yellow[900],
      ),
      body: const Center(
        child: Image(
          image: AssetImage(
            'images/coal.png',
          ),
        ),
      ),
    ),
  ));
}
