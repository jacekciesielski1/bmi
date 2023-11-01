import 'package:flutter/material.dart';
import 'package:bmi/components/constants.dart';


class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon, this.tap);

  final IconData icon;
  Function tap;



  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: (){
        tap();

      },
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon,
        color: Colors.white,),
    );
  }
}


class CardInside2 extends StatelessWidget {

  CardInside2(this.value, this.text,this.tap1, this.tap2);

  final String text;
  final int? value;
  Function tap1;
  Function tap2;



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kLabelTextStyle2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(Icons.remove,tap1),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(Icons.add,tap2),
          ],
        ),
      ],
    );
  }
}


