import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:greek_to_3/utils/constants.dart';
import 'package:greek_to_3/utils/buttons.dart';
import 'package:greek_to_3/utils/textFieldOutput.dart';
import 'package:provider/provider.dart';
import 'package:greek_to_3/LogicStuff/changeNotifier.dart';

class OutputLayout extends StatelessWidget {
  final double boxSide;
  OutputLayout(this.boxSide);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          decoration: kFieldDecoration2,
          width: boxSide,
          height: boxSide,
          alignment: Alignment.center,
          child: TextFieldOutput(
              Provider.of<Data>(context, listen: false).controllerText2),
        ),
        Positioned(
          bottom: -27,
          child: ButtonTranslate(),
        ),
      ],
    );
  }
}
