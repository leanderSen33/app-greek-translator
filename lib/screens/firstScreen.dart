import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greek_to_3/layouts/inputLayout.dart';
import 'package:greek_to_3/layouts/colorLayout.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    required this.orientation,
    required this.boxSide,
  });

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
              children: layoutFirstScreen(boxSide),
            ),
          );
        else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: layoutFirstScreen(boxSide),
          );
        }
      },
    );
  }
}

List<Widget> layoutFirstScreen(boxSide) {
  return [
    SizedBox(height: 50.0, width: 60.0),
    InputLayout(boxSide),
    ColorLayout(boxSide),
  ];
}
