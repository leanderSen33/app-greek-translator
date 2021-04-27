import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import 'package:flutter/material.dart';

class BrainWordCorrector {
  // Load the ExceptionsList from tbe Asset folder.
  Future<String> _loadAsset() async {
    return await rootBundle.loadString('assets/ListInLatinWithoutBrackets.txt');
  }

  RegExp _separator = RegExp(r"[();:., !'-]");
  RegExp _separatorWithSlash = RegExp(r"[();:., !'-/]");
  RegExp _isLatin = RegExp(r"[A-Za-z]+");

  Map _mismatchedLetters = {
    'E': 'ε',
    'K': 'κ',
    'P': 'ρ',
    'A': 'α',
    'B': 'β',
    'T': 'τ',
    'Y': 'υ',
    'I': 'ι',
    'O': 'ο',
    'H': 'η',
    'Z': 'ζ',
    'X': 'χ',
    'N': 'ν',
    'M': 'μ',
  };

  List _greekAlphabet = [
    'Ε',
    'Ρ',
    'Τ',
    'Υ',
    'Θ',
    'Ι',
    'Ο',
    'Π',
    'Α',
    'Σ',
    'Δ',
    'Φ',
    'Γ',
    'Η',
    'Ξ',
    'Κ',
    'Λ',
    'Ζ',
    'Χ',
    'Ψ',
    'Ω',
    'Ω',
    'Β',
    'Ν',
    'Μ'
  ];

  Map _greekAbbreviationsMap = {
    'E': ' ευρώ',
    'Λ': ' λεπτά',
    'AP': 'Αριθμός',
    'KAPTA': 'κάρτα',
    'EXOYN': 'έχουν',
    'ETAIPEIA': 'εταιρεία',
    // 'MEΛOΣ': 'μέλος', // add a different group for greek words.
  };

  String e = 'E';
  String l = 'Λ';
  String ap = 'AP';
  String karta = 'KAPTA';
  String exoyn = 'EXOYN';
  String etaipeia = 'ETAIPEIA';

  bool _isGreek(String word) {
    List<String> wordSplit = word.split('');

    for (var letters in wordSplit) {
      bool isGreek = _greekAlphabet.contains(letters);

      if (isGreek == true) {
        return true;
      }
    }
    return false;
  }

  Future<String> wordCorrector(String message) async {
    List wordsList = message.split(_separator);
    for (var word in wordsList) {
      if (wordsList.contains('A/A')) {
        String finalWord = word;
        finalWord = finalWord.replaceAll('A/A', 'Αυξων Αριθμός');
        message = message.replaceFirst(word, finalWord);
      }
    }
    List wordsList2 = message.split(_separatorWithSlash);
    for (var word in wordsList2) {
      if (_isGreek(word)) {
        var minutesAbbreviation = RegExp(r'^[0-9]+Λ$').hasMatch(word);
        if (minutesAbbreviation) {
          String numOfMinutesWord = word;
          for (var element in _greekAbbreviationsMap.keys) {
            numOfMinutesWord = numOfMinutesWord.replaceFirst(
                element, _greekAbbreviationsMap[element]);
          }
          message = message.replaceFirst(word, numOfMinutesWord);
        }
        _addGreekWord(word); // Add to the Word Painter to paint latin chars
        String finalWord = word;
        for (var letter in _mismatchedLetters.keys) {
          finalWord = finalWord.replaceAll(letter, _mismatchedLetters[letter]);
        }
        message = message.replaceFirst(word, finalWord);
      } else {
        var exceptionsListII = await _loadAsset();
        List<String> exceptionListSplitII = exceptionsListII.split(", ");
        if (exceptionListSplitII.contains(word) ||
            word == e ||
            word == l ||
            word == ap ||
            word == karta ||
            word == exoyn ||
            word == etaipeia) {
          String toPaint = word;
          _addGreekWord(toPaint);
        } else {
          _addNonGreekWord(word);
        }

        var euroAbbreviation = RegExp(r'^[0-9]+E$').hasMatch(word);
        if (euroAbbreviation) {
          String endWord = word;

          for (var element in _greekAbbreviationsMap.keys) {
            endWord =
                endWord.replaceFirst(element, _greekAbbreviationsMap[element]);
          }
          message = message.replaceFirst(word, endWord);
        }
        if (_greekAbbreviationsMap.containsKey(word) && word != 'E') {
          message = message.replaceFirst(word, _greekAbbreviationsMap[word]);
        }
        var exceptionsList = await _loadAsset();
        List<String> exceptionListSplit = exceptionsList.split(", ");
        if (exceptionListSplit.contains(word) && word != 'A/A') {
          String finalWord = word;
          for (var letter in _mismatchedLetters.keys) {
            finalWord =
                finalWord.replaceAll(letter, _mismatchedLetters[letter]);
          }

          message = message.replaceFirst(word, finalWord);
        }
      }
    }

    return message.toLowerCase();
  }

  List<TextSpan> _finalColorList = [];
  List<TextSpan> getFinalList() => _finalColorList;

  void _addNonGreekWord(String word) async {
    word = word + ' ';
    _addNormalLetter(word);
  }

  void _addGreekWord(String word) {
    word = word + ' ';
    List textList = word.split('');
    for (var letter in textList) {
      if (_isLatin.hasMatch(letter)) {
        addColoredLetter(letter);
      } else {
        _addNormalLetter(letter);
      }
    }
  }

  bool isLowerCase = true;

  List<TextSpan> addColoredLetter(String letter) {
    _finalColorList.add(
      TextSpan(
          text: isLowerCase ? letter.toLowerCase() : letter, // toLowerCase() ?
          style: TextStyle(color: Colors.pinkAccent)),
    );
    return _finalColorList;
  }

  List<TextSpan> _addNormalLetter(String letter) {
    _finalColorList.add(
      TextSpan(text: letter),
    );
    return _finalColorList;
  }
}
