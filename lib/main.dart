import 'package:flutter/material.dart';
import 'package:flutter_application_intercity/data_example/example_list.dart';
import 'package:flutter_application_intercity/view/list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_application_intercity/data/station.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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
        ],
      ),
    ));
  }

  void _filterList(String searchText) {
    _filteredStationList.clear();
    if (searchText.isEmpty) {
      _filteredStationList.addAll(_stations);
    } else {
      _stations.forEach((item) {
        if (item.name.toLowerCase().contains(searchText.toLowerCase()) ||
            item.codeIBNR.toString().contains(searchText) ||
            item.codeEPA.toString().contains(searchText)) {
          _filteredStationList.add(item);
        }
      });
    }
    setState(() {});
  }
}
