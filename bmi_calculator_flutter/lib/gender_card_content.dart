import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';

class GenderCardContent extends StatelessWidget {
  const GenderCardContent({
    @required this.icon,
    @required this.text,
    Key key,
  }) : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
