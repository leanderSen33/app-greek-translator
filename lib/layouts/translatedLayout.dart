import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greek_to_3/utils/buttons.dart';
import 'package:greek_to_3/LogicStuff/changeNotifier.dart';
import 'package:provider/provider.dart';

class TranslatedLayout extends StatelessWidget {
  final double boxSide;
  TranslatedLayout(this.boxSide);
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
            color: Color(0XFF428ae0),
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
              child: Text(
                Provider.of<Data>(context).showTranslatedText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -27,
          child: ButtonRefresh(), // Button in charge of fixing the greek text
        ),
        // Positioned(
        //   bottom: -27,
        //   child: ButtonOutput(),
        // ),
      ],
    );
  }
}
