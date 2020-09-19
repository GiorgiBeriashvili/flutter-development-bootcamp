import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final _audioCache = AudioCache();
  final _colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _buildInstrumentKeys(),
          ),
        ),
      ),
    );
  }

  List<InstrumentKey> _buildInstrumentKeys() {
    List<InstrumentKey> _instrumentKeys = List<InstrumentKey>();

    for (int index = 0; index < 7; index++) {
      _instrumentKeys.add(
        InstrumentKey(
          color: _colors[index],
          onPressed: () => _audioCache.play('note${index + 1}.wav'),
        ),
      );
    }

    return _instrumentKeys;
  }
}

class InstrumentKey extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  InstrumentKey({this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: color,
        child: null,
        onPressed: onPressed,
      ),
    );
  }
}
