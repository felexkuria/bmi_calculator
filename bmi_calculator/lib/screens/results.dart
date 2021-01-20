import 'package:bmi_calculator/Widgets/bottom_button.dart';
import 'package:bmi_calculator/Widgets/reusable_card.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ResuableCard(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Normal',
                      style: kResultTextStyle,
                    ),
                    Text(
                      '18.3',
                      style: kBmiTextStyle,
                    ),
                    Text(
                      'Your Bmi Result is Quite Low You Should Eat More!!!',
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    BottomButton(onTap: null, buttonTittle: 'Re-Calculate')
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
