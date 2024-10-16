import 'package:flutter/material.dart';

enum HeatmapColors {
  zero,
  oneToFive,
  sixToTen,
  elevenPlus;

  Color getColor() {
    switch (this) {
      case HeatmapColors.zero:
        return Colors.white60;
      case HeatmapColors.oneToFive:
        return const Color.fromRGBO(145, 145, 145, 1.0);
      case HeatmapColors.sixToTen:
        return const Color.fromRGBO(70, 70, 70, 1.0);
      case HeatmapColors.elevenPlus:
        return const Color.fromRGBO(0, 0, 0, 1.0);
      default:
        return Colors.white60;
    }
  }
}
