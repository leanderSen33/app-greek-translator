import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:greek_to_3/utils/constants.dart';
import 'package:greek_to_3/utils/buttons.dart';
import 'package:greek_to_3/utils/texfFieldInput.dart';

class InputLayout extends StatelessWidget {
  final double boxSide;
  InputLayout(this.boxSide);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          decoration: kFieldDecoration1,
          width: boxSide,
          height: boxSide,
          alignment: Alignment.center,
          child: TextFieldInput(), // Here we paste our greek SMS
        ),
        Positioned(
          bottom: -27,
          child:
              ButtonVisualizeColors(), // Button in charge of fixing the greek text
        ),
      ],
    );
  }
}
