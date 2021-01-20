import 'package:flutter/material.dart';

import '../constant.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTittle;

  BottomButton({@required this.onTap, @required this.buttonTittle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTittle,
            style: kLargeTextStyle,
          ),
        ),
        color: kbottomContainerColor,
        padding: EdgeInsets.only(bottom: 20.0),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContainierHeight,
      ),
    );
  }
}
