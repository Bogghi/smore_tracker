import 'package:flutter/material.dart';

import 'package:smoke_tracker/widgets/panel.dart';
import 'package:smoke_tracker/widgets/habit_button.dart';
import 'package:smoke_tracker/meta/constants.dart';

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
          height: firstPanelHeight,
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
                SizedBox(
                  width:  double.infinity,
                  height: unit*2+(unit/3*2),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        HabitButton(
                          label: "No Smoking",
                          onPressed: (){},
                        ),
                        HabitButton(
                          label: "No Smoking",
                          onPressed: (){},
                        ),
                        HabitButton(
                          label: "No Smoking",
                          onPressed: (){},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
        const SizedBox(height: spacing),
        SizedBox(
          width: double.infinity,
          height: secondPanelHeight,
          child: Panel(
            child: Placeholder()
          ),
        )
      ],
    );
  }
}
