import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greek_to_3/layouts/translatedLayout.dart';

import 'package:greek_to_3/layouts/outputLayout.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key? key,
    required this.orientation,
    required this.boxSide,
  }) : super(key: key);

  final Orientation orientation;
  final double boxSide;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (orientation.index == Orientation.landscape.index)
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: layoutSecondScreen(
                boxSide,
              ),
            ),
          );
        else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: layoutSecondScreen(boxSide),
          );
        }
      },
    );
  }
}

List<Widget> layoutSecondScreen(boxSide) {
  return [
    OutputLayout(boxSide),
    SizedBox(height: 50.0, width: 60.0),
    TranslatedLayout(boxSide),
  ];
}
