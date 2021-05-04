import 'package:flutter/cupertino.dart';
import 'package:greek_to_3/logic/brainCorrector.dart';
import 'package:greek_to_3/data/testSet.dart';
import 'package:test/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TestSet testSet = TestSet();
  Map testMap = testSet.getSMS();
  testMap.forEach((key, value) => testSMS(key, value));
  }
  void testSMS(String key, String value){
    BrainWordCorrector brainCorrector = BrainWordCorrector();
    test(key, () {
      String correctedText = brainCorrector.wordCorrector(key);
      expect(correctedText, value);
    });
}