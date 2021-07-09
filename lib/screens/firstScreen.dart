import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:greekfix/layouts/inputLayout.dart';
import 'package:greekfix/layouts/colorLayout.dart';
import 'package:greekfix/utils/buttons.dart';
import 'package:greekfix/logic/changeNotifier.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    required this.orientation,
    required this.boxSide,
  });

  final Orientation orientation;
  final double boxSide;

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  late Animation degOneTranslationAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 170));
    degOneTranslationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.orientation.index == Orientation.landscape.index)
          return Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: layoutFirstScreenLandscape(
                  widget.boxSide, widget.orientation),
            ),
          );
        else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: layoutFirstScreenPortrait(
                boxSide: widget.boxSide,
                orientation: widget.orientation,
                degAnimation: degOneTranslationAnimation,
                getRadiansFromDegree: getRadiansFromDegree,
                animationStuff: animationController),
          );
        }
      },
    );
  }
}

List<Widget> layoutFirstScreenPortrait(
    {boxSide,
    orientation,
    degAnimation,
    getRadiansFromDegree,
    animationStuff}) {
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            // IgnorePointer is the solution for the non responding buttons.
            IgnorePointer(
              child: Container(
                color: Colors.transparent,
                height: 150.0,
                width: 200.0,
              ),
            ),
            Transform.translate(
              offset: Offset.fromDirection(
                  getRadiansFromDegree(180.0), degAnimation.value * 80),
              child: ButtonVisualizeColors(),
            ),
            Transform.translate(
              offset: Offset.fromDirection(
                  getRadiansFromDegree(0.0), degAnimation.value * 80),
              child: ButtonDelete(),
            ),
            ButtonPaste(animationStuff),
          ],
        ),
      ),
    ),
    Expanded(
      flex: 6,
      child: ColorLayout(boxSide, orientation),
    ),
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
          //ButtonPaste(),
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
  ];
}
