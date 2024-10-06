import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.menu),
              iconSize: 25,
              onPressed: () {},
            ),
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("No smoking days", style: TextStyle(fontSize: 24)),
                      Text("15", style: TextStyle(fontSize: 48)),
                      Text("30% to next day", style: TextStyle(fontSize: 15)),
                      SizedBox(height: 15,),
                      LinearProgressIndicator(
                        value: 0.7,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation(Color.fromARGB(125, 128, 128, 128)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Placeholder(),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
