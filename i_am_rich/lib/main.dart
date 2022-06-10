import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.blueGrey[600],
    appBar: AppBar(
      title: const Text('I Am Rich'),
      backgroundColor: Colors.blueGrey[900],
    ),
    body: const Center(
        child: Image(
      image: NetworkImage(
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
    )),
  )));
}
