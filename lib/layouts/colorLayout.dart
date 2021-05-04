import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greek_to_3/logic/brainCorrector.dart';
import 'package:greek_to_3/utils/buttons.dart';
import 'package:greek_to_3/logic/changeNotifier.dart';
import 'package:provider/provider.dart';

class ColorLayout extends StatelessWidget {
  final double boxSide;
  ColorLayout(this.boxSide);
//0XFFf96778
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          width: boxSide,
          height: boxSide,
          alignment: Alignment.center,
          child: Container(
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              width: boxSide + 20,
              height: boxSide,
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children:
                      Provider.of<Data>(context, listen: true).showColorText,
                ),
              ), // Text(
              // Provider.of<Data>(context).showTranslatedText,
              // style: TextStyle(color: Colors.white),
              //),
            ),
          ),
        ),
        Positioned(
          bottom: -27,
          child: ButtonFixText(), // Button in charge of fixing the greek text
        ),
        Positioned(
          right: -14,
          bottom: 100,
          child: ButtonSwitchCase(),
        )
        // Positioned(
        //   bottom: -27,
        //   child: ButtonOutput(),
        // ),
      ],
    );
  }
}
