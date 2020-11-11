import 'package:flutter/material.dart';
import 'package:bmi_calculator/Widgets/icon_content.dart';
import 'package:bmi_calculator/Widgets/reusable_card.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainierHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(
  0xFFEB1555,
);
enum Gender { female, male }

//

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

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
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          print(' male was pressed');
                          selectedGender = Gender.male;
                        });
                      },
                      child: ResuableCard(
                        colour: selectedGender == Gender.male
                            ? activeCardColor
                            : inActiveCardColor,
                        cardChild: IconContent(
                          iconData: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                        print(' female was pressed');
                      });
                    },
                    child: ResuableCard(
                      colour: selectedGender == Gender.female
                          ? activeCardColor
                          : inActiveCardColor,
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
                child: ResuableCard(
              colour: activeCardColor,
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
                      colour: activeCardColor,
                    ),
                  )),
                  Expanded(
                      child: ResuableCard(
                    colour: activeCardColor,
                  )),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainierHeight,
            )
          ],
        ));
  }
}
