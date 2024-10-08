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
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      Text(
                        "No smoking days",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "15",
                        style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "30% to next day",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      LinearProgressIndicator(
                        value: 0.7,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation(
                          Color.fromARGB(125, 128, 128, 128),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Smoking heat map",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 5),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: heatMap(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey.shade400,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget heatMap() {
    List<Column> columns = [];
    // Color Colors.white60 and size is 15
    var gridItem = Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );

    for(int i = 0; i <= 46; i++) {
      if(i < 46){
        columns.add(Column(
          children: [
            gridItem,
            gridItem,
            gridItem,
            gridItem,
            gridItem,
            gridItem,
            gridItem,
            gridItem,
          ],
        ));
      }else {
        columns.add(Column(
          children: [
            gridItem,
            gridItem,
          ],
        ));
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columns,
    );
  }
}
