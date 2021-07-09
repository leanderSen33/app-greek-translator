import 'package:flutter/material.dart';
import 'package:greekfix/logic/brainCorrector.dart';
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
  bool pageSnappingChange = true;

  bool getStartedButtonOn = false;

  bool pasteButtonOn = false;
  String pasteIconStatus = 'pasteIcon';

  bool visualizeButtonOn = false;
  String visualizeIconStatus = 'eyeOff';

  bool deleteButtonOn = false;
  String deleteIconStatus = 'deleteOff';

  bool switchCaseButtonOn = false;
  String switchCaseIconStatus = 'caseOff';

  bool fixButtonOn = false;
  String fixIconStatus = 'fixOff';

  bool copyButtonOn = false;
  String copyIconStatus = 'copyOff';

  bool translateButtonOn = false;
  String translateIconStatus = 'translateOff';

  bool returnButtonOn = false;
  String returnIconStatus = 'returnOff';

  var brainCorrector = BrainWordCorrector();
  final PageController controllerPage = PageController(initialPage: 0);

  // pasted text
  TextEditingController controllerText1 = TextEditingController();

  // text corrected and displayed in the lower textField.
  TextEditingController controllerText2 = TextEditingController();

  void clipboardPasteText() async {
    final value = await FlutterClipboard.paste();
    controllerText1.text = value;
    pasteButtonOn = !pasteButtonOn;
    pasteButtonOn
        ? pasteIconStatus = 'pasteOff'
        : pasteIconStatus = 'pasteIcon';

    notifyListeners();
  }

  void deleteButtonDynamic(
      String imageNameOn, String imageNameOff, bool buttonStatus) {
    deleteButtonOn = !deleteButtonOn;
    deleteButtonOn
        ? deleteIconStatus = imageNameOn
        : deleteIconStatus = imageNameOff;
  }

  void clipboardDeleteText() {
    controllerText1.clear();

    deleteButtonDynamic('deleteIcon', 'deleteOff', deleteButtonOn);
    pasteButtonOn = false;
    pasteIconStatus = 'pasteOff';

    if (visualizeButtonOn == true) {
      visualizeButtonOn = false;
      visualizeIconStatus = 'eyeOff';
    }

    if (showColoredText.isNotEmpty) {
      showColoredText = [];
      showColoredText.clear();
    }

    Duration oneSecond = Duration(seconds: 1);
    Future.delayed(oneSecond, () {
      deleteButtonOn = false;
      deleteIconStatus = 'deleteOff';
      notifyListeners(); // if we don't notify listeners here, after the 1 second, nothing will happen until another button is pressed.
    });

    notifyListeners();
  }

  void visualizeButton() {
    print('Controller 1 Pre: ${controllerText1.text}');
    visualizeButtonOn = !visualizeButtonOn;
    visualizeButtonOn
        ? visualizeIconStatus = 'eyeIcon'
        : visualizeIconStatus = 'eyeOff';
    smsCorrected = brainCorrector.wordCorrector(controllerText1.text);
    showColoredText = brainCorrector.finalList;
    notifyListeners();
  }

  void switchCaseButton() {
    switchCaseButtonOn = !switchCaseButtonOn;
    switchCaseButtonOn
        ? switchCaseIconStatus = 'caseIcon'
        : switchCaseIconStatus = 'caseOff';
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
    fixButtonOn = !fixButtonOn;
    fixButtonOn ? fixIconStatus = 'fixIcon' : fixIconStatus = 'fixOff';
    controllerText2.text = smsCorrected;
    print('FIXED MESSAGE: ${controllerText2.text}');
    input = smsCorrected;
    // controllerPage.jumpToPage(2);
    controllerPage.animateToPage(1,
        duration: Duration(seconds: 2), curve: Curves.ease);
    pageSnappingChange = false;
    notifyListeners();
  }

  void clipboardCopyText() async {
    copyButtonOn = !copyButtonOn;
    copyButtonOn ? copyIconStatus = 'copyIcon' : copyIconStatus = 'copyOff';

    await FlutterClipboard.copy(controllerText2.text);

    Duration oneSecond = Duration(seconds: 1);
    Future.delayed(oneSecond, () {
      copyButtonOn = false;
      copyIconStatus = 'copyOff';
      notifyListeners();
    });

    notifyListeners();
    // Scaffold.of(contextOutputField)
    //     .showSnackBar(SnackBar(content: Text('√ Copied to Clipboard')));
  }

  void translateButtonDynamic() {
    translateButtonOn = !translateButtonOn;
    translateButtonOn
        ? translateIconStatus = 'translateIcon'
        : translateIconStatus = 'translateOff';
    notifyListeners();
  }

  void translateButton() async {
    translateButtonDynamic();

    var translatedText;
    await googleTranslateAPI
        .translate(input, from: 'el', to: 'en')
        .then((value) => translatedText = value);
    print('Translation: $translatedText');

    showTranslatedText = translatedText.text;
    controllerPage.animateToPage(1,
        duration: Duration(seconds: 1), curve: Curves.linear);
    notifyListeners();
  }

  void refreshButton() {
    returnButtonOn = !returnButtonOn;
    returnButtonOn
        ? returnIconStatus = 'returnIcon'
        : returnIconStatus = 'returnOff';

    pasteButtonOn = false;
    pasteIconStatus = 'pasteIcon';
    visualizeButtonOn = false;
    visualizeIconStatus = 'eyeOff';
    deleteButtonOn = false;
    deleteIconStatus = 'deleteOff';
    switchCaseButtonOn = false;
    switchCaseIconStatus = 'caseOff';
    fixButtonOn = false;
    fixIconStatus = 'fixOff';
    copyButtonOn = false;
    copyIconStatus = 'copyOff';
    translateButtonOn = false;
    translateIconStatus = 'translateOff';

    smsCorrected = '';
    controllerText1.text = '';
    controllerText2.text = '';
    controllerText1.clear();
    controllerText2.clear();
    showTranslatedText = '';
    showColoredText = [];
    showColoredText.clear();
    pageSnappingChange = true;
    controllerPage.animateToPage(0,
        duration: Duration(seconds: 1), curve: Curves.linear);

    Duration oneSecond = Duration(seconds: 1);
    Future.delayed(oneSecond, () {
      returnButtonOn = false;
      returnIconStatus = 'returnOff';
      notifyListeners();
    });

    notifyListeners();
  }

  void pressGetStarted() {
    getStartedButtonOn = true;
    notifyListeners();

    Duration oneSecond = Duration(seconds: 2);
    Future.delayed(oneSecond, () {
      getStartedButtonOn = false;
      notifyListeners();
    });
  }

// Use this in case we want to show the changes in the input textField.
// void passingPastedText(String newString) {
//   sms = newString;
//   notifyListeners();
// }

}
