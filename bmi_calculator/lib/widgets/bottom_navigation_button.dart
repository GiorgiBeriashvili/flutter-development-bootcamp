import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomNavigationButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  BottomNavigationButton({
    @required this.onTap,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: Center(
          child: Text(
            this.title,
            style: largeButtonTextStyle,
          ),
        ),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        // padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
