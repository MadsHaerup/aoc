import 'dart:io';
import 'dart:convert';
  void main() {
  String part = Platform.environment["part"] ?? "part1";
  File file = new File('input.txt');
  file.readAsString().then((String contents) {
    var lines = contents.split('\n');
    List<String> list = [];
    for (var line in lines) {
      if (part == "part1") {
      var a1 = line.replaceAll('A Y', '8');
      var a2 = a1.replaceAll('A Z', '3');
      var a3 = a2.replaceAll('A X', '4');
      var s1 = a3.replaceAll('C Y', '2');
      var s2 = s1.replaceAll('C Z', '6');
      var s3 = s2.replaceAll('C X', '7');
      var p1 = s3.replaceAll('B X', '1');
      var p2 = p1.replaceAll('B Z', '9');
      var p3 = p2.replaceAll('B Y', '5');
      list.add(p3);
      } else if (part == "part2") {
      var a1 = line.replaceAll('A Y', '4'); 
      var a2 = a1.replaceAll('A Z', '8'); 
      var a3 = a2.replaceAll('A X', '3'); 
      var s1 = a3.replaceAll('C Y', '6'); 
      var s2 = s1.replaceAll('C Z', '7'); 
      var s3 = s2.replaceAll('C X', '2'); 
      var p1 = s3.replaceAll('B X', '1'); 
      var p2 = p1.replaceAll('B Z', '9'); 
      var p3 = p2.replaceAll('B Y', '5'); 
      list.add(p3);
      } 
    }
    List<int> list2 = list.map((i) => int.parse(i)).toList();
    var sum = 0;
    for (var i = 0; i < list2.length; i++) {
      sum += list2[i];
    }
    print(sum);
  });
}
