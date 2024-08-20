import 'dart:developer';

import 'package:flutter/material.dart';

class ResaultProvider with ChangeNotifier {
  List<Map<int, dynamic>> answers = [];

//for checkbox
  List<bool> isCheckedList = [];

  addAnswer(Map<int, dynamic> answer) {
    answers.add(answer);
    notifyListeners();
  }

//for polar type
  Map<int, dynamic> findResautWithKey(int keyToFind) {
    return answers.firstWhere(
      (map) => map.containsKey(keyToFind),
      orElse: () => {},
    );
  }

  // bool findMapByKeyIfExists(int keyToFind) {
  //   return answers.any((map) => map.containsKey(keyToFind));
  // }

//used for text_questions
//return text
  String? getValueByKey(int keyToFind) {
    for (var map in answers) {
      if (map.containsKey(keyToFind)) {
        return map[keyToFind];
      }
    }
    return null; // Return null if the key doesn't exist in any map
  }

//used for radio
  int getradioValueByKey(int keyToFind) {
    for (var map in answers) {
      if (map.containsKey(keyToFind)) {
        Map check = map[keyToFind];
        log(check.toString());
        log(check.keys.first.toString());
        return check.keys.first;
      }
    }
    return -1; // Return null if the key doesn't exist in any map
  }

//for polar button
  bool checkValueByKey(int keyToFind, String polar) {
    for (var map in answers) {
      if (map.containsKey(keyToFind)) {
        return map[keyToFind] == polar;
      }
    }
    return false; // Return false if the key doesn't exist in any map
  }

//for polar button before adding removing if available
  void removeByKey(int keyToRemove) {
    answers.removeWhere((map) => map.containsKey(keyToRemove));
  }

  clearAnswer() {
    answers.clear();
    notifyListeners();
  }
}
