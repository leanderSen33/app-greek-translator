import 'package:flutter/material.dart';
import 'package:greek_to_3/logic/brainCorrector.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:translator/translator.dart';

class Data with ChangeNotifier {
  GoogleTranslator googleTranslateAPI = GoogleTranslator();
  String smsCorrected = '';
  String input = '';
  String showTranslatedText = '';
  List<TextSpan> showColoredText = [];
  List<TextSpan> get showColorText => showColoredText;
  bool switchText = false;

  var brainCorrector = BrainWordCorrector();
  final PageController controllerPage = PageController(initialPage: 0);

  // pasted text
  TextEditingController controllerText1 = TextEditingController();

  // text corrected and displayed in the lower textField.
  TextEditingController controllerText2 = TextEditingController();

  void clipboardPasteText() async {
    final value = await FlutterClipboard.paste();
    controllerText1.text = value;
    notifyListeners();
  }

  void clipboardDeleteText() {
    controllerText1.clear();
    notifyListeners();
  }

  void visualizeButton() {
    print('Controller 1 Pre: ${controllerText1.text}');
    smsCorrected = brainCorrector.wordCorrector(controllerText1.text);
    showColoredText = brainCorrector.finalList;
    notifyListeners();
  }

  void switchCaseButton() {
    switchText = !switchText;
    switchText ? changeLetterCase(switchText) : changeLetterCase(switchText);
    notifyListeners();
  }

  void changeLetterCase(bool status) {
    brainCorrector.isLowerCase = switchText;
    brainCorrector.wordCorrector(controllerText1.text);
    showColoredText = brainCorrector.finalList;
  }

  void fixButton() async {
    controllerText2.text = smsCorrected;
    print('FIXED MESSAGE: ${controllerText2.text}');
    input = smsCorrected;
    controllerPage.jumpToPage(1);
    notifyListeners();
  }

  void clipboardCopyText() async {
    await FlutterClipboard.copy(controllerText2.text);
    // Scaffold.of(contextOutputField)
    //     .showSnackBar(SnackBar(content: Text('√ Copied to Clipboard')));
  }

  void translateButton() async {
    var translatedText;
    await googleTranslateAPI
        .translate(input, from: 'el', to: 'en')
        .then((value) => translatedText = value);
    print('Translation: $translatedText');
    showTranslatedText = translatedText.text;
    notifyListeners();
  }

  void refreshButton() {
    smsCorrected = '';
    controllerPage.jumpToPage(0);
    controllerText1.text = '';
    controllerText2.text = '';
    controllerText1.clear();
    controllerText2.clear();
    showTranslatedText = '';
    showColoredText = [];
    showColoredText.clear();
    notifyListeners();
  }

// Use this in case we want to show the changes in the input textField.
// void passingPastedText(String newString) {
//   sms = newString;
//   notifyListeners();
// }

}
