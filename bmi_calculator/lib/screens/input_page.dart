import 'package:flutter/material.dart';
import 'package:bmi_calculator/Widgets/icon_content.dart';
import 'package:bmi_calculator/Widgets/reusable_card.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainierHeight = 80.0;
const activeCardColuor = Color(0xFF1D1E33);
const bottomContainerColor = Color(
  0xFFEB1555,
);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                    child: ResuableCard(
                      colour: activeCardColuor,
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                      child: ResuableCard(
                    colour: activeCardColuor,
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
              colour: activeCardColuor,
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ResuableCard(
                    colour: activeCardColuor,
                  )),
                  Expanded(
                      child: ResuableCard(
                    colour: activeCardColuor,
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
