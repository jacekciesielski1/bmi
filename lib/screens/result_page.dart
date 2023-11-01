import 'package:flutter/material.dart';
import 'package:bmi/components/constants.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:bmi/components/bottom_button.dart';


class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult, required this.resultText, required this.interpretation});


  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "YOUR RESULT",
                style: kLabelStyleText4,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                kActiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toUpperCase(), style: kLabelStyleText5),
                    Text(
                      bmiResult,
                      style: kLabelTextStyle6,
                    ),
                    Text(
                      interpretation,
                      style: kLabelTextStyle7,
                    ),
                  ],
                ),
                () {}),
          ),
          BottomButton("RECALCULATE", () {
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}
