import 'package:bmi_calculator/core/calculator.dart';
import 'package:bmi_calculator/widgets/bottom_navigation_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Calculator calculator = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    calculator.getEvaluation().toUpperCase(),
                    style: resultTextStyle,
                  ),
                  Text(
                    calculator.result.toStringAsFixed(1),
                    style: bmiTextStyle,
                  ),
                  Text(
                    calculator.getInterpretation(),
                    textAlign: TextAlign.center,
                    style: bodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomNavigationButton(
            onTap: () => Navigator.pop(context),
            title: 'RETURN',
          ),
        ],
      ),
    );
  }
}
