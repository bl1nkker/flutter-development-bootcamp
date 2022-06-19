import 'package:bmi_calculator_flutter/gender_card_content.dart';
import 'package:bmi_calculator_flutter/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xffeb1555);

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender = GenderType.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = GenderType.male;
                    });
                  },
                  child: ReusableCard(
                    cardColor: selectedGender == GenderType.female
                        ? inactiveCardColor
                        : activeCardColor,
                    cardChild: GenderCardContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = GenderType.female;
                    });
                  },
                  child: ReusableCard(
                    cardColor: selectedGender == GenderType.male
                        ? inactiveCardColor
                        : activeCardColor,
                    cardChild: GenderCardContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            cardColor: activeCardColor,
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardColor: activeCardColor,
                )),
                Expanded(
                    child: ReusableCard(
                  cardColor: activeCardColor,
                )),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            width: double.infinity,
            height: 80,
          )
        ],
      ),
    );
  }
}
