import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:smoke_tracker/assets/habit_type_enum.dart';


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
    final key = 'hb_${_genID()}';
    habits![key] = {
      'key': key,
      'name': habit,
      'type': HabitTypeEnum.daily,
      'entry': [],
      'created': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    };
    notifyListeners();
    return true;
  }

  bool logHabit(String key) {
    if(habits == null || habits?[key] == null) {
      return false;
    }

    habits![key]['entry'].add({
      'e_key': 'hb_e_${_genID()}',
      'logTime': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    });

    notifyListeners();
    return true;
  }

  List<dynamic> getHabits({HabitTypeEnum type = HabitTypeEnum.daily, bool entry = false}) {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final List<dynamic> todayHabits = [];

    habits?.forEach((key, habit) {

      if(!entry) {
        var firstMatch = habit['entry'].firstWhere(
              (entry) => entry['logTime'].substring(0, 10) == today,
          orElse: () => "no match",
        );
        if(habit['type'] == type && firstMatch == "no match") {
          todayHabits.add({
            'name': habit['name'],
            'key': habit['key'],
          });
        }
      }else {

      }

    });

    return todayHabits;
  }

  String _genID() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
