import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard(this.color, this.cardChild, this.tap);

  final Color color;
  final Widget? cardChild;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       tap();
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}