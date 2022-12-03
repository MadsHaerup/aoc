import 'dart:io';
import 'dart:core';
String commonCharacter(String str1, String str2) {
  String common = "";
  for (int i = 0; i < str1.length; i++) {
    for (int j = 0; j < str2.length; j++) {
      if (str1[i] == str2[j]) {
        common += str1[i];
        break;
      }
    }
  }
  return common.substring(0, 1);
}
int findLowerCaseLetter(String letter) {
  var alphabet = 'abcdefghijklmnopqrstuvwxyz';
  var position = alphabet.indexOf(letter) + 1;
  return position;
}
int findUpperCaseLetter(String letter) {
  var alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  var position = alphabet.indexOf(letter) + 27;
  if (position == 26) {
    position = 0;
  }
  return position;
}
void main() {
  String part = Platform.environment["part"] ?? "part1";
  var file = new File('input.txt');
  var items = file.readAsLinesSync();
  List<dynamic> indexOfLowerCaseLetters = [];
  List<dynamic> indexOfUpperCaseLetters = [];

  if (part == "part1") {
    List<dynamic> rucksacks = [];
    for (var item in items) {
      var length = item.length;
      var half = length ~/ 2;
      var first = item.substring(0, half);
      var second = item.substring(half, length);
      rucksacks.add(commonCharacter(first, second));
      var common = commonCharacter(first, second);
      indexOfUpperCaseLetters.add(findUpperCaseLetter(common));
      indexOfLowerCaseLetters.add(findLowerCaseLetter(common));
    }
  } else if (part == "part2") {
    var elfGroups = [];
    for (var i = 0; i < items.length; i += 3) {
      elfGroups.add(items.sublist(i, i + 3));
    }
    for (var badge in elfGroups) {
      var common = '';
      for (var i = 0; i < badge[0].length; i++) {
        var c = badge[0][i];
        if (badge[1].contains(c) && badge[2].contains(c)) {
          common += c;
        }
      }
      var letter = common.substring(0, 1);
      indexOfUpperCaseLetters.add(findUpperCaseLetter(letter));
      indexOfLowerCaseLetters.add(findLowerCaseLetter(letter));
    }
  }
  List<int> priorities = [];
  for (var i = 0; i < indexOfLowerCaseLetters.length; i++) {
    priorities.add(indexOfLowerCaseLetters[i] + indexOfUpperCaseLetters[i]);
  }
  final sumOfPriorities = priorities.reduce((value, element) => value + element);
  print(sumOfPriorities);
}
