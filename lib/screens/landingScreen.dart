import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:greek_to_3/screens/firstScreen.dart';
import 'package:greek_to_3/screens/secondScreen.dart';
import 'package:greek_to_3/logic/changeNotifierExtender.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controllerPage = Provider.of<Data>(context).controllerPage;
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    double boxSide = size.shortestSide - 80;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PageView(
          controller: controllerPage,
          scrollDirection: Axis.vertical,
          children: [
            FirstScreen(orientation: orientation, boxSide: boxSide),
            SecondScreen(orientation: orientation, boxSide: boxSide),
          ],
        ),
      ),
    );
  }
}
