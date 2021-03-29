import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNum) {
    final player = AudioCache();
    player.play('note$soundNum.wav');
  }

  Expanded buildKey({int soundNum, Color color, String scale}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundNum);
        },
        child: Text(
          scale,
          style: TextStyle(
            fontSize: 40.0,
            color: Colors.white54,
          ),
        ),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red[900], soundNum: 1, scale: 'Do'),
              buildKey(color: Colors.orange[800], soundNum: 2, scale: 'Re'),
              buildKey(color: Colors.yellow[700], soundNum: 3, scale: 'Mi'),
              buildKey(color: Colors.green[600], soundNum: 4, scale: 'Fa'),
              buildKey(color: Colors.blue[500], soundNum: 5, scale: 'So'),
              buildKey(color: Colors.purple[400], soundNum: 6, scale: 'La'),
              buildKey(color: Colors.pink[300], soundNum: 7, scale: 'Si'),
            ],
          ),
        ),
      ),
    );
  }
}
