import 'package:flutter/material.dart';

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
                    ),
                  ),
                  Expanded(
                      child: ResuableCard(
                    colour: activeCardColuor,
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

class ResuableCard extends StatelessWidget {
  ResuableCard({@required this.colour});
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
