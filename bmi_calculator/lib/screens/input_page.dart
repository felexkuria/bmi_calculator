import 'package:bmi_calculator/Widgets/bottom_button.dart';
import 'package:bmi_calculator/Widgets/rounded_icon_button.dart';
import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Widgets/icon_content.dart';
import 'package:bmi_calculator/Widgets/reusable_card.dart';
import 'package:bmi_calculator/constant.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { female, male }

//

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 80;
  int age = 18;

//   Color maleCardColour = inActiveCardColor;
//   Color femaleCardColour = inActiveCardColor;
// // female=2, male =1
//   void updateColor(Gender selectedGender) {
//     //male card selected

//     if (selectedGender == Gender.male) {
//       if (maleCardColour == inActiveCardColor) {
//         maleCardColour = activeCardColor;
//         femaleCardColour = inActiveCardColor;
//       } else {
//         maleCardColour = inActiveCardColor;
//       }
//     }
//     //female card  pressed
//     if (selectedGender == Gender.female) {
//       if (femaleCardColour == inActiveCardColor) {
//         femaleCardColour = activeCardColor;
//         maleCardColour = inActiveCardColor;
//       } else {
//         femaleCardColour = inActiveCardColor;
//       }
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                    onPress: () {
                      setState(() {
                        print(' male was pressed');
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kactiveCardColor
                        : kinActiveCardColor,
                    cardChild: IconContent(
                      iconData: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                    child: ResuableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                      print(' female was pressed');
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kactiveCardColor
                      : kinActiveCardColor,
                  cardChild: IconContent(
                    iconData: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: ResuableCard(
            colour: kactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: klabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kNumberTextStyle),
                    Text('cm', style: klabelTextStyle),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTickMarkColor: Color(0xFF8D8E98),
                    activeTickMarkColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 70,
                      max: 250,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    print('male was selected');
                  },
                  child: ResuableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: ResuableCard(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: klabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
            buttonTittle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calculatorBrain =
                  CalculatorBrain(height: height, weight: weight);
              String bmi = calculatorBrain.calculateBmi();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calculatorBrain.calculateBmi(),
                    resultText: calculatorBrain.getResult(bmi),
                    interpretation: calculatorBrain.getInterpretation(bmi),
                  ),
                ),
              );

              // Navigator.pushNamed(
              //   context,
              //   'first',
              //   arguments:bmiResult: calculatorBrain.calculateBmi(),
              // resultText: calculatorBrain.getResult(),
              // interpretation: calculatorBrain.getInterpretation(),
              // );
            },
          )
        ],
      ),
    );
  }
}
