import 'package:flutter/material.dart';

class Habits extends ChangeNotifier {
  Map<String, dynamic>? habits;

  Habits({
    this.habits,
  });

  bool addHabit(String habit) {
    habits ??= {};
    if (habits!.containsKey(habit)) {
      return false;
    }
    habits![habit] = {
      'key': 'hb_${genID()}',
      'entry': [],
      'created': DateTime.now(),
    };
    notifyListeners();
    return true;
  }

  bool logHabit(String habit) {
    if(habits == null || !habits?[habit]) {
      return false;
    }

    habits![habit]['entry'].add({
      'key': 'hb_e_${genID()}',
      'logTime': DateTime.now(),
    });

    notifyListeners();
    return true;
  }

  String genID() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
