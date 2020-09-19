import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _leftDieNumber = 1;
  int _rightDieNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$_leftDieNumber.png'),
              onPressed: () => _rollDice(),
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$_rightDieNumber.png'),
              onPressed: () => _rollDice(),
            ),
          ),
        ],
      ),
    );
  }

  void _rollDice() {
    setState(() {
      _leftDieNumber = _generateRandomDiceNumber();
      _rightDieNumber = _generateRandomDiceNumber();
    });
  }

  int _generateRandomDiceNumber() => Random().nextInt(6) + 1;
}
