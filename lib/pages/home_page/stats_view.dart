import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smoke_tracker/widgets/panel.dart';
import 'package:smoke_tracker/widgets/habit_button.dart';
import 'package:smoke_tracker/meta/constants.dart';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import 'package:smoke_tracker/providers/habits_provider.dart';

class StatsView extends StatelessWidget {
  final double viewHeight;

  const StatsView({
    super.key,
    required this.viewHeight
  });

  @override
  Widget build(BuildContext context) {
    final unit = viewHeight * 0.1;
    final firstPanelHeight = unit * 4;
    final secondPanelHeight = unit * 6;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: unit*10,
          child: Panel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width:  double.infinity,
                  height: unit/2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Text(
                          "Today Habbyts",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
                            ),
                            padding: EdgeInsets.all(5),
                            minimumSize: Size.zero,
                          ),
                          child: Transform.rotate(
                            angle: 45 * 3.1415926535897932 / 180,
                            child: const Icon(Icons.arrow_upward, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    child: Column(
                      children: context.watch<HabitsProvider>().getTodayHabits().map((e) {
                        return HabitButton(
                          label: e['name'],
                          onPressed: () {
                            context.read<HabitsProvider>().logHabit(e['key']);
                          },
                        );
                      }).toList() ?? [],
                    ),
                  ),
                )
              ],
            ),
          )
        ),
        /*const SizedBox(height: spacing),
        SizedBox(
          width: double.infinity,
          height: secondPanelHeight,
          child: Panel(
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(
                        "Habit Heatmap",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: unit/3*2,
                        child: AnimatedToggleSwitch<int>.rolling(
                            current: 0,
                            values: [0, 1],
                            onChanged: (i) => print('Current index: $i'),
                            iconBuilder: (i,x) => Icon(Icons.circle, color: Colors.white),
                            // iconList: [...], you can use iconBuilder, customIconBuilder or iconList
                          // many more parameters available
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
        )*/
      ],
    );
  }
}
