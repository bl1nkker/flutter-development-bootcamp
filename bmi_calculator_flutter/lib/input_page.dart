import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    double defaultPadding = 15.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    cardColor: Color(0xFF1D1E33),
                  )),
                  SizedBox(
                    width: defaultPadding * 2,
                  ),
                  Expanded(
                      child: ReusableCard(
                    cardColor: Color(0xFF1D1E33),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: defaultPadding * 2,
            ),
            Expanded(
                child: ReusableCard(
              cardColor: Color(0xFF1D1E33),
            )),
            SizedBox(
              height: defaultPadding * 2,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    cardColor: Color(0xFF1D1E33),
                  )),
                  SizedBox(
                    width: defaultPadding * 2,
                  ),
                  Expanded(
                      child: ReusableCard(
                    cardColor: Color(0xFF1D1E33),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  ReusableCard({
    @required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
