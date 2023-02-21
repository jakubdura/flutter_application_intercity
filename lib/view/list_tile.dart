import 'package:flutter/material.dart';
import '../data/shared_preferences.dart';
import '../data/station.dart';

class ListStationTile extends StatefulWidget {
  const ListStationTile({
    super.key,
    required this.station,
  });

  final Station station;
  @override
  State<ListStationTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<ListStationTile> {
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredBox(
          color: getStationColor(widget.station),
          child: ListTile(
            leading: const Icon(
              Icons.subway,
              color: Colors.black,
              size: 60,
            ),
            title: Text(widget.station.name),
            subtitle: Text('Typ: ${getStationType(widget.station)}'),
            style: ListTileStyle.list,
            trailing: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text('IBNR: ${widget.station.codeIBNR}'),
                  Text(widget.station.codeEPA != null
                      ? 'EPA: ${widget.station.codeEPA}'
                      : ""),
                ],
              ),
            ),
            onTap: () {
              onTapItem(widget.station.name);
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Color getStationColor(Station station) {
    Color color = const Color.fromARGB(255, 224, 199, 171);
    if (station.type == "normal") {
      color = const Color.fromARGB(255, 243, 156, 18);
    } else if (station.type == "meta") {
      color = const Color.fromARGB(255, 249, 105, 14);
    }
    return color;
  }

  String getStationType(Station station) {
    String stationType = "nieznany";
    if (station.type == "normal") {
      stationType = "normalna";
    } else if (station.type == "meta") {
      stationType = "metastacja";
    }
    return stationType;
  }

  void onTapItem(String nameOfItem) {
    saveLastSelectedStation(nameOfItem);
    final snackBar = SnackBar(
      content: Text('Wybrano stacje: $nameOfItem'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
