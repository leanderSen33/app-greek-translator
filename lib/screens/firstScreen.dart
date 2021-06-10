import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:greekfix/layouts/inputLayout.dart';
import 'package:greekfix/layouts/colorLayout.dart';
import 'package:greekfix/utils/buttons.dart';

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
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: layoutFirstScreenLandscape(boxSide, orientation),
            ),
          );
        else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: layoutFirstScreenPortrait(boxSide, orientation),
          );
        }
      },
    );
  }
}

List<Widget> layoutFirstScreenPortrait(boxSide, orientation) {
  return [
    Expanded(
      child: SizedBox(height: 40),
    ),
    Expanded(
      flex: 6,
      child: InputLayout(boxSide, orientation),
    ),
    Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonPaste(),
            SizedBox(
              width: 20,
            ),
            ButtonVisualizeColors(),
            SizedBox(
              width: 20,
            ),
            ButtonDelete(),
          ],
        ),
      ),
    ),

    //SizedBox(height: 10.0, width: 20.0),
    Expanded(flex: 6, child: ColorLayout(boxSide, orientation)),
    Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonSwitchCase(),
            SizedBox(
              width: 20,
            ),
            ButtonFixText(),
          ],
        ),
      ),
    ),
    SizedBox(height: 20),
  ];
}

List<Widget> layoutFirstScreenLandscape(boxSide, orientation) {
  return [
    //SizedBox(width: 10),
    SizedBox(width: 17),
    Expanded(
      flex: 6,
      child: InputLayout(boxSide, orientation),
    ),
    Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonPaste(),
          SizedBox(
            height: 40,
          ),
          ButtonVisualizeColors(),
          SizedBox(
            height: 40,
          ),
          ButtonDelete(),
        ],
      ),
    ),
    Expanded(
      flex: 6,
      child: ColorLayout(boxSide, orientation),
    ),
    Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonSwitchCase(),
          SizedBox(
            height: 40,
          ),
          ButtonFixText(),
        ],
      ),
    ),
    SizedBox(width: 10),
    // Expanded(
    //   child: SvgPicture.asset('assets/images/delete.svg',
    //       semanticsLabel: 'rectangle11stroke'),
    // ),
  ];
}
