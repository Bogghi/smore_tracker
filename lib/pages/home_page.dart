import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:smoke_tracker/assets/heatmap_colors_enum.dart';
import 'package:smoke_tracker/widgets/panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Panel(
                  child: const Column(
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
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Panel(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Smoking heat map",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: heatMap(),
                        ),
                      ),
                      heatMapExplain(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.3,
                  0,
                  0,
                  2,
                ),
                child: Panel(
                  padding: 10,
                  child: Container(
                    child: Column(
                      children: [
                        const Text(
                          "Today counter",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(106, 106, 106, 0.3),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 7,
                              )
                            ],
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(106, 106, 106, 1),
                                      overlayColor: Colors.grey,
                                    ),
                                    child: const Icon(
                                      CupertinoIcons.plus,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text(
                                      "0",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(106, 106, 106, 1),
                                      overlayColor: Colors.grey,
                                    ),
                                    child: const Icon(
                                      CupertinoIcons.minus,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
          color: HeatmapColors.zero.getColor(),
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

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: columns,
        ),
      ],
    );
  }

  Widget heatMapExplain() {
    List<Widget> rowItems = [];

    for (var color in HeatmapColors.values) {
      rowItems.add(
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: color.getColor(),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      );
      rowItems.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            color.getLabel(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Row(
      children: rowItems,
    );
  }
}
