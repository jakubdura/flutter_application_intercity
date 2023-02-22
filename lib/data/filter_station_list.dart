import 'package:flutter_application_intercity/data/station.dart';

List<Station> filterStationList(List<Station> stations, String searchText) {
  final List<Station> filteredList = [];
  if (searchText.isEmpty) {
    filteredList.addAll(stations);
  } else {
    for (var item in stations) {
      if (item.name.toLowerCase().contains(searchText.toLowerCase()) ||
          item.codeIBNR.toString().contains(searchText) ||
          item.codeEPA.toString().contains(searchText)) {
        filteredList.add(item);
      }
    }
  }
  return filteredList;
}
