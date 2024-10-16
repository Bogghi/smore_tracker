import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  final Widget child;
  double padding;

  Panel({
    super.key,
    required this.child,
    this.padding = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(700, 166, 173, 167),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5)
            )
          ]
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}
