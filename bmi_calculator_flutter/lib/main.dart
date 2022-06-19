import 'package:bmi_calculator_flutter/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: InputPage(),
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
          primaryColor: Color(0xFF0A0E21),
        ));
  }
}
