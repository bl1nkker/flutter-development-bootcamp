import 'package:bmi_calculator_flutter/constants.dart';
import 'package:bmi_calculator_flutter/gender_card_content.dart';
import 'package:bmi_calculator_flutter/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender = GenderType.male;
  int height = 180;

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
                  cardColor: selectedGender == GenderType.female
                      ? kInactiveCardColor
                      : kActiveCardColor,
                  cardChild: GenderCardContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                  onCardTapped: () {
                    setState(() {
                      selectedGender = GenderType.male;
                    });
                  },
                )),
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedGender == GenderType.male
                        ? kInactiveCardColor
                        : kActiveCardColor,
                    cardChild: GenderCardContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                    onCardTapped: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            cardColor: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    overlayColor: Color(0x29eb1555),
                    thumbColor: Color(0xffeb1555),
                    trackHeight: 1,
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xff8d8e98),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (double newVal) {
                      setState(() {
                        height = newVal.round();
                      });
                    },
                    min: 120.0,
                    max: 220.0,
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardColor: kActiveCardColor,
                )),
                Expanded(
                    child: ReusableCard(
                  cardColor: kActiveCardColor,
                )),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            width: double.infinity,
            height: 80,
          )
        ],
      ),
    );
  }
}
