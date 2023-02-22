import 'package:flutter/material.dart';
import 'package:flutter_application_intercity/data/example_list.dart';
import 'package:flutter_application_intercity/view/json_page.dart';
import 'package:flutter_application_intercity/view/list_tile.dart';
import 'package:flutter_application_intercity/data/station.dart';

import '../data/filter_station_list.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final TextEditingController _textController = TextEditingController();
  final List<Station> _stations = exampleStationList;
  final List<Station> _filteredStationList = [];

  @override
  void initState() {
    super.initState();
    _filteredStationList.addAll(_stations);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Intercity Jakub Dura'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: "Szukaj...",
                  ),
                  onChanged: (searchText) {
                    _filterList(searchText);
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: _filteredStationList.length,
                    itemBuilder: (context, index) =>
                        ListStationTile(station: _filteredStationList[index]),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('Lista stacji json'),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const JsonPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  void _filterList(String searchText) {
    _filteredStationList.clear();
    _filteredStationList.addAll(filterStationList(_stations, searchText));
    setState(() {});
  }
}
