import 'package:flutter/material.dart';
import 'package:bmi/components/constants.dart';




class BottomButton extends StatelessWidget {
  BottomButton(this.title, this.tap);
  final Function tap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tap();
      },
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            title,
            style: kLabelTextStyle3,
          ),
        ),
      ),
    );
  }
}