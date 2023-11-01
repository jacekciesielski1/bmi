import 'package:flutter/material.dart';
import 'package:bmi/components/constants.dart';



class cardInside extends StatelessWidget {
  final IconData icontype;
  final String iconText;

  cardInside(this.iconText, this.icontype);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icontype,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          iconText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}