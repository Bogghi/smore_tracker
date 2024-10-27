import 'package:flutter/material.dart';

import 'stats_view.dart';
import 'package:smoke_tracker/meta/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final safeAreaHeight = mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom - spacing * 2;
    final viewHeight = safeAreaHeight * 0.9 - spacing;
    final navigatorHeight = safeAreaHeight * 0.1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(spacing),
          child: Column(
            children: [
              SizedBox (
                width: double.infinity,
                height: viewHeight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: spacing),
                  child: StatsView(
                    viewHeight: viewHeight-spacing*2,
                  ),
                ),
              ),
              SizedBox (
                width: double.infinity,
                height: navigatorHeight,
                child: Placeholder(),
              )
            ],
          ),
        ),
      )
    );
  }
}
