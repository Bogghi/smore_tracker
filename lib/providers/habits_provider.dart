import 'package:flutter/material.dart';

class HabitsProvider extends ChangeNotifier {
  Map<String, dynamic>? habits;

  HabitsProvider({
    this.habits,
  });

  bool addHabit(String habit) {
    habits ??= {};
    if (habits!.containsKey(habit)) {
      return false;
    }
    habits![habit] = {
      'key': 'hb_${_genID()}',
      'name': habit,
      'type': 'daily',
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
      'key': 'hb_e_${_genID()}',
      'logTime': DateTime.now(),
    });

    notifyListeners();
    return true;
  }

  Map<String,dynamic>? getHabits() {
    return habits;
  }

  String _genID() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
