import 'package:flutter/material.dart';

import '/pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromRGBO(142, 152, 145, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        textTheme: const TextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            textStyle: const TextStyle(
              color: Colors.white,
            ),
            overlayColor: Colors.grey.shade800,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey.shade600,
        ),
      ),
      home: HomePage(),
    );
  }
}
