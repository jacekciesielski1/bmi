import 'package:flutter/material.dart';
import 'package:bmi/components/constants.dart';
import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/components/icon_content.dart';
import 'package:bmi/components/icon_content_2.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:bmi/screens/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/calculator.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 75;
  int age = 25;

  void tapFunction(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardInside("MALE", FontAwesomeIcons.mars), () {
                      tapFunction(Gender.male);
                    }),
                  ),
                  Expanded(
                    child: ReusableCard(
                        selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardInside("FEMALE", FontAwesomeIcons.venus), () {
                      tapFunction(Gender.female);
                    }),
                  ),
                ]),
          ),
          Expanded(
            child: ReusableCard(
                kActiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kLabelTextStyle2,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30.0,
                          )),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 250.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                        inactiveColor: Color(0xFF8D8E98),
                      ),
                    )
                  ],
                ),
                () {}),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        CardInside2(weight, "WEIGHT(kg)", () {
                          setState(() {
                            weight--;
                          });
                        }, () {
                          setState(() {
                            weight++;
                          });
                        }),
                        () {}),
                  ),
                  Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        CardInside2(
                          age,
                          "AGE",
                          () {
                            setState(() {
                              age--;
                            });
                          },
                          () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                        () {}),
                  ),
                ]),
          ),
          BottomButton(
            "CALCULATE",
            () {
              Calculator calculator =
                  Calculator(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  bmiResult: calculator.calculateBMI(),
                  resultText: calculator.getResult(),
                  interpretation: calculator.getInterpretation(),
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
