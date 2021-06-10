import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greekfix/logic/changeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:greekfix/utils/boxSideConfig.dart';

class TranslatedLayout extends StatelessWidget {
  final double boxSide;

  final Orientation orientation;
  TranslatedLayout(this.boxSide, this.orientation);

  final BoxSideConfig boxSideConfig = BoxSideConfig();
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: Color(0XFFD4D7D9),
      width: boxSideConfig.boxSideWidthLogic(orientation, boxSide),
      height: boxSideConfig.boxSideHeightLogic(orientation, boxSide),
      borderRadius: 30,
      depth: 40,
      spread: 5,
      emboss: false,
      child: Padding(
        padding: const EdgeInsets.all(23.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
            Provider.of<Data>(context).showTranslatedText,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
