import 'package:flutter/material.dart';

class HabitButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const HabitButton({
    super.key,
    required this.label,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            Icons.circle_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
          const SizedBox(width: 5),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
