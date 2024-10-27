import 'package:flutter/material.dart';

import 'package:smoke_tracker/widgets/panel.dart';
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
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Today Habbyts",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width:  double.infinity,
                  height: unit*2+unit/2,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Icon(Icons.circle_outlined),
                              const SizedBox(width: 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "No Smoking",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Icon(Icons.circle),
                              const SizedBox(width: 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "No Smoking",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Icon(Icons.circle_outlined),
                              const SizedBox(width: 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "No Smoking",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Icon(Icons.check_circle_outline),
                              const SizedBox(width: 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "No Smoking",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
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
