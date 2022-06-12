import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(String file) {
    final player = AudioCache();
    player.play(file);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: Colors.red,
                child: InkWell(
                  onTap: () {
                    playSound('note1.wav');
                  },
                  child: SizedBox(height: 40),
                ),
              ),
              Material(
                color: Colors.orange,
                child: InkWell(
                  onTap: () {
                    playSound('note2.wav');
                  },
                  child: SizedBox(height: 40),
                ),
              ),
              Material(
                color: Colors.yellow,
                child: InkWell(
                  onTap: () {
                    playSound('note3.wav');
                  },
                  child: SizedBox(height: 40),
                ),
              ),
              Material(
                color: Colors.green,
                child: InkWell(
                  onTap: () {
                    playSound('note4.wav');
                  },
                  child: SizedBox(height: 40),
                ),
              ),
              Material(
                color: Colors.teal,
                child: InkWell(
                  onTap: () {
                    playSound('note5.wav');
                  },
                  child: SizedBox(height: 40),
                ),
              ),
              Material(
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    playSound('note6.wav');
                  },
                  child: SizedBox(height: 40),
                ),
              ),
              Material(
                color: Colors.deepPurple,
                child: InkWell(
                  onTap: () {
                    playSound('note7.wav');
                  },
                  child: SizedBox(height: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
