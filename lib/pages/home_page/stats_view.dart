import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smoke_tracker/widgets/panel.dart';
import 'package:smoke_tracker/widgets/habit_button.dart';

import 'package:smoke_tracker/providers/habits_provider.dart';

class StatsView extends StatefulWidget {
  final double viewHeight;

  const StatsView({
    super.key,
    required this.viewHeight
  });

  @override
  State<StatsView> createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: widget.viewHeight,
          child: Panel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        "Today Habbyts",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const Spacer(),
                      ToggleButtons(
                        children: [
                          const Icon(Icons.today, color: Colors.white),
                          const Icon(Icons.history, color: Colors.white),
                        ],
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            setState(() {
                              isSelected = isSelected.map((e) => !e).toList();
                            });
                          });
                        },
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    child: Column(
                      children: context.watch<HabitsProvider>().getHabits().map((e) {
                        return HabitButton(
                          label: e['name'],
                          onPressed: () {
                            context.read<HabitsProvider>().logHabit(e['key']);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ],
    );
  }
}
