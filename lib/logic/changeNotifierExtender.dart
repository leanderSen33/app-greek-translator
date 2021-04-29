import 'package:flutter/material.dart';
import 'package:greek_to_3/logic/brainCorrector.dart';
import 'package:greek_to_3/logic/brain.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:translator/translator.dart';

class Data extends ChangeNotifier {

  final PageController controllerPage = PageController(initialPage: 0);

  TextEditingController controllerText1 = TextEditingController(); // pasted text
  TextEditingController controllerText2 =  TextEditingController(); // text corrected and displayed in the lower textField.
  GoogleTranslator googleTranslateAPI = GoogleTranslator();
  BrainWordCorrector brainCorrector = BrainWordCorrector();
  Brain brain = Brain();
  List<TextSpan> showColoredText = [];
  String showTranslatedText = '';
  String smsCorrected = '';
  String input = '';
  bool switchText = false;

  var translatedText;


  void clipboardPasteText() async {
    final value = await FlutterClipboard.paste();
    controllerText1.text = value;
    notifyListeners();
  }

  void clipboardDeleteText() {
    controllerText1.clear();
    notifyListeners();
  }

  void visualizeButton() async {
    // print('Controller 1 Pre: ${controllerText1.text}');
    smsCorrected = brain.corrector(controllerText1.text);
    showColoredText = brainCorrector.getFinalList(); // TEST
    // controllerText1.text = '';
    notifyListeners();
  }

  void switchCaseButton() async {
    switchText = !switchText;
    //brainCorrector.isLowerCase = false;
    //smsCorrected = await brainCorrector.wordCorrector(controllerText1.text);
    // switchText
    //     ? showColoredText = []
    //     : showColoredText = brainCorrector.getFinalList();
    if(switchText){
      brainCorrector.isLowerCase = true;
      showColoredText = [];
    }
    else {
      brainCorrector.isLowerCase = false;
      showColoredText = brainCorrector.getFinalList();
    }
    // showColoredText = brainCorrector.getFinalList();
    notifyListeners();
  }

  void clipboardCopyText() async {
    await FlutterClipboard.copy(controllerText2.text);
    // Scaffold.of(contextOutputField)
    //     .showSnackBar(SnackBar(content: Text('√ Copied to Clipboard')));
  }

  void fixButton() async {
    //smsCorrected = await brainCorrector.wordCorrector(controllerText1.text);
    controllerText2.text = smsCorrected;
    // print('FIXED MESSAGE: ${controllerText2.text}');
    input = smsCorrected;
    controllerPage.jumpToPage(1);
    notifyListeners();
  }

  void translateButton() async {
    await googleTranslateAPI
        .translate(input, from: 'el', to: 'en')
        .then((value) => translatedText = value);
    // print('Traducido: $translatedText');
    showTranslatedText = translatedText.text;
    notifyListeners();
  }

  void refreshButton() {
    smsCorrected = '';
    controllerPage.jumpToPage(0);
    //clearFields();
    controllerText1.text = '';
    controllerText2.text = '';
    controllerText1.clear();
    controllerText2.clear();
    showTranslatedText = '';
    showColoredText = [];
    notifyListeners();
  }

// Use this in case we want to show the changes in the input textField.
// void passingPastedText(String newString) {
//   sms = newString;
//   notifyListeners();
// }

}
