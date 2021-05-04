List<String> listOfSeparators = ['/', '-', ":", "."];
String sms =
    "Hola pepe soy enrique-ramos/El-toro/David-Moreno:23.22E:reto/test como estas?";
List<String> finalList = [];
void main() {
  separateWord(sms);
//   print(finalList);
  print(sms);
  print(finalList.join(' '));
}

void separateWord(String wordGroup) {
  List<String> wordGroupList = sms.split(' ');
  for (String wordGroup in wordGroupList) {
//     print(wordGroup);
    checkSeparator(0, wordGroup);
  }
}

void checkSeparator(int index, String wordGroup) {
  if (wordGroup.contains(listOfSeparators[index])) {
//     print(index);
//     print(listOfSeparators[index]);
//     print(wordGroup);
    String separator = listOfSeparators[index];
    List<String> ListOfGroup = wordGroup.split(separator);
    index++;
    if (ListOfGroup.length >= 1) {
//       print("logs1");
//       print(ListOfGroup.length);
      for (String group in ListOfGroup) {
//         print(group);
        if (index < listOfSeparators.length &&
            group.contains(listOfSeparators[index])) {
          checkSeparator(index, group);
          if (ListOfGroup.last != group) {
            addToFinalList(separator);
          }
        } else {
          addToFinalList(group);
          if (ListOfGroup.last != group) {
            addToFinalList(separator);
          }
        }
      }
    }
  } else {
    addToFinalList(wordGroup);
  }
}

void addToFinalList(String word) {
  finalList.add(word);
}
