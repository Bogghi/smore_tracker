import 'package:flutter/material.dart';
import 'package:smoke_tracker/assets/heatmap_colors_enum.dart';
import 'package:smoke_tracker/widgets/panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          ],
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
