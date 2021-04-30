import 'package:flutter/material.dart';
import 'dart:ui';
import 'utils/constants.dart';
import 'screens/landingScreen.dart';
import 'package:provider/provider.dart';
import 'package:greek_to_3/logic/changeNotifier.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final double screenWidth = window.physicalSize
      .width; // -> dart:ui  // si hay problemas pasarla al metodo build.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) {
        return Data();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EL Translator',
        theme: ThemeData(
            primaryColor: kColorWhite,
            accentColor: kDarkBlue,
            scaffoldBackgroundColor:
                Colors.grey[900], // ==> body color for the scaffold
            fontFamily: "Montserrat"),
        home: LandingScreen(),
      ),
    );
  }
}
