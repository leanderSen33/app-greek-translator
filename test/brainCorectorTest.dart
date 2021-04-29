import 'package:flutter/cupertino.dart';
import 'package:greek_to_3/logic/brainCorrector.dart';
import 'package:test/test.dart';
import 'package:greek_to_3/logic/brain.dart';
import 'dart:io';
import 'dart:async' show Future;
import 'package:translator/translator.dart';

void main() {
  Brain brain = Brain();

  BrainWordCorrector brainCorrector = BrainWordCorrector();
  WidgetsFlutterBinding.ensureInitialized();
  GoogleTranslator googleTranslateAPI = GoogleTranslator();
  test('Test first text', () async {
    print(Directory.current);
    String originalText = 'WESTERN UNION! ΓIA AΠOΣTOΛH-ΠAPAΛABH XPHMATΩN, ΠΛHPΩMH ΛOΓ/ΣMΩN ΣTEΛNEIΣ SMS ΣTO 13033 ME TO 3 ΩΣ ΛOΓO METAKINHΣHΣ(METABAΣH ΣE TPAΠEZA).INFO/STOP SMS 2109005000.';
    String expectedText = 'Western Union! FOR MONEY RECEIVED, SMS PAYMENT SEND SMS to 13033 with 3 AS MOVEMENT (TRANSPORT ON BANK) .INFO / STOP SMS 2109005000.';
    String correctedText = brainCorrector.wordCorrectorWrapper(originalText);
    String translatedText = '';
    await googleTranslateAPI
        .translate(correctedText, from: 'el', to: 'en')
        .then((value) => translatedText = value.text);
    print(originalText);
    print(expectedText);
    print(correctedText);
    print(translatedText);
    expect(translatedText, expectedText);
  });
}