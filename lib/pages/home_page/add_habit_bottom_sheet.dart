import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smoke_tracker/meta/constants.dart';
import 'package:smoke_tracker/providers/habits_provider.dart';

class AddHabitBottomSheet extends StatefulWidget {
  const AddHabitBottomSheet({
    super.key,

  });

  @override
  State<AddHabitBottomSheet> createState() => _AddHabitBottomSheetState();
}

class _AddHabitBottomSheetState extends State<AddHabitBottomSheet> {
  final habitNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.2,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(spacing),
        child: Column(
          children: [
            TextField(
              controller: habitNameController,
              decoration: InputDecoration(
                hintText: 'Enter habit name',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade800, width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                )
              ),
            ),
            const SizedBox(height: spacing),
            ElevatedButton(
              onPressed: () {
                if(habitNameController.text.isEmpty) {
                  return;
                }
                context.read<HabitsProvider>().addHabit(habitNameController.text);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.grey.shade600,
              ),
              child: const Text('Add Habit'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
