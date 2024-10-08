import 'package:flutter/material.dart';
import 'package:smoke_tracker/widgets/Panel.dart';

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
            const Panel(
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
            const SizedBox(
              height: 2,
            ),
            Panel(
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
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text("0", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text("1-5", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(145, 145, 145, 1.0),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text("6-10", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(70, 70, 70, 1.0),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text("10+", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 0, 0, 1.0),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromRGBO(166, 173, 167, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
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
          ],
        ));
      }else {
        columns.add(Column(
          children: [
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
