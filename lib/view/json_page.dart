import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_intercity/view/list_tile.dart';
import 'package:flutter_application_intercity/data/station.dart';

class JsonPage extends StatefulWidget {
  const JsonPage({super.key});

  @override
  State<JsonPage> createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  final List<Station> _stationsJson = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intercity Jakub Dura'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(28.0),
            child: Text(
              "Lista stacji utworzonych z json:",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getStationsJson(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      itemCount: _stationsJson.length,
                      itemBuilder: (context, index) =>
                          ListStationTile(station: _stationsJson[index]),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future getStationsJson() async {
    // http://transport.opendata.ch/v1/locations?query=station;
    // https://transport.opendata.ch/docs.html
    var response = await http.get(Uri.https(
        'transport.opendata.ch', 'v1/locations', {'query': 'station'}));
    var jasonData = jsonDecode(response.body);
    _stationsJson.clear();

    for (var eachStation in jasonData['stations']) {
      final station = Station(
          name: eachStation['name'],
          type: 'normal',
          codeIBNR: int.parse(eachStation['id']));
      _stationsJson.add(station);
    }
  }
}
