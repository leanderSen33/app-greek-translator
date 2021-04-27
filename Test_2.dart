import 'dart:async';
import 'dart:io';

// // we omit async and await because we're using the then. syntax.
// // .readAsString returns a String.
// void gettingString() {
//   File file = File('files/yourFile.txt');
//   file.readAsString().then((value) {
//     print('Read as String: $value');
//   });
// }

// Stream<String> greekWords(Iterable<String> streamingGreekWords) async* {
//   for (var words in streamingGreekWords) yield words;
// }

// This is the other way. Using the async and await keywords.
// .readAsLines returns a List.
// gettingLine() async {
//   File file = File('files/ListInLatinWithoutBrackets.txt');
//   List<String> result2 = await file.readAsLines();
//   return result2;
// }

Future getList() async {
  File file = File('assets/ListInLatinWithoutBrackets.txt');
  String result2 = await file.readAsString();
  //List<String> finalString = singleWords.split(",");
  return result2;
}

void main() async {
  // List<String> readAsLineList = await gettingLine();
  // String singleWords = readAsLineList.toString();
  // List<String> finalString = singleWords.split(",");
  // print(finalString.length);
  String test = await getList();
  print(test);
}

// gettingString();

// print('Read as Line: $resultingLine \n');
// print('Type for Resulting: ${resultingLine.runtimeType}');
// // stdout.writeAll([resultingString], "");

// Stream firstStream = greekWords(resultingLine);
//
// firstStream.where((event) => event.contains('Α'));

//
// firstStream.listen(
//   (event) {
//     String modifyCase = event;
//     print('Streamed: ${modifyCase.toUpperCase()}');
//   },
// );

// String bo = '';
// for (var word in resultingLine) {
//   // print(word);
//   String newWord = word;
//   bo = newWord.toUpperCase();
//   print('UpperCasedWord: $bo');
// }
// stdout.writeln('\n result: $bo');

//
// void fixWords(Iterable<String> list) {
//   String stringOfList = list.toString();
//   String upperWord;
//
//   for (String word in list) {
//     upperWord = word.toUpperCase();
//     for (String letter in specialLetters.keys) {
//       upperWord = upperWord.replaceAll(letter, specialLetters[letter]);
//       // print(upperWord);
//     }
//     stringOfList = stringOfList.replaceFirst(word, upperWord);
//   }
//
//   print(stringOfList);
// }
