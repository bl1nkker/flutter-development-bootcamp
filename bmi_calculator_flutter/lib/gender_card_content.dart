import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xff8d8e98));

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
          style: labelTextStyle,
        )
      ],
    );
  }
}
