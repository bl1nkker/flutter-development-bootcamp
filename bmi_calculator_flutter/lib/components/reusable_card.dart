import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Function onCardTapped;
  final Color cardColor;
  final Widget cardChild;
  ReusableCard({@required this.cardColor, this.cardChild, this.onCardTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTapped,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardChild,
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
