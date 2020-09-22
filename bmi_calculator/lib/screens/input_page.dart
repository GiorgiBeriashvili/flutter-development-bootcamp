import 'package:bmi_calculator/core/calculator.dart';
import 'package:bmi_calculator/widgets/bottom_navigation_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int _age = 20;
  int _height = 180;
  int _weight = 60;
  Gender _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: _selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onTap: () => setState(() => _selectedGender = Gender.male),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: _selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onTap: () =>
                        setState(() => _selectedGender = Gender.female),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$_height',
                        style: numberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayColor: Color(0x29EB1555),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: _height.toDouble(),
                      onChanged: (double value) =>
                          setState(() => _height = value.round()),
                      min: 120.0,
                      max: 220.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          '$_weight',
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () => setState(() => _weight++),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () => setState(() => _weight--),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          '$_age',
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () => setState(() => _age++),
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () => setState(() => _age--),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationButton(
            onTap: () => Navigator.pushNamed(
              context,
              '/results',
              arguments: Calculator(_height, _weight),
            ),
            title: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
