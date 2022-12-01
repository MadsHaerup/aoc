import 'dart:io';

void main(List<String> args) {
  String part = Platform.environment["part"] ?? "part2";

  final file = new File('input.txt');
  var contents = file.readAsStringSync();
  var items = contents.split('\n');

  List groups = [];
  List group = [];
  for (var line in items) {
    if (line.isEmpty) {
      groups.add(group);
      group = [];
    } else {
      group.add(line);
    }
  }

  List list = [];
  groups.forEach((items) {
    var arr2 = items.map((e) => int.parse(e.trim())).toList();
    var result = arr2.reduce((value, element) => value + element);

    list.add(result);
  });

  var highest = list[0];
  for (var i = 0; i < list.length; i++) {
    if (list[i] > highest) {
      highest = list[i];
    }
  }

  list.sort((a, b) => b.compareTo(a));
  final sublist = list.sublist(0, 3);
  final topThree = sublist.reduce((value, element) => value + element);

    if (part == "part1") {
    print(highest);
  } else if (part == "part2") {
    print(topThree);
  } else {
    print("Unknown part " + part);
  }
}
