import 'package:flutter_application_intercity/data/filter_station_list.dart';
import 'package:flutter_application_intercity/data/station.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('filterStationList', () {
    test('returns all stations when searchText is empty', () {
      final stations = [
        const Station(
            name: 'Warszawa', type: 'normal', codeIBNR: 122, codeEPA: 456),
        const Station(
            name: 'Wrocław', type: 'normal', codeIBNR: 789, codeEPA: 1011),
        const Station(
            name: 'Łódź', type: 'normal', codeIBNR: 123, codeEPA: 454),
      ];
      const searchText = '';
      final filteredList = filterStationList(stations, searchText);

      expect(filteredList, equals(stations));
    });

    test('filters stations by codeIBNR', () {
      final stations = [
        const Station(
            name: 'Warszawa', type: 'normal', codeIBNR: 122, codeEPA: 456),
        const Station(
            name: 'Wrocław', type: 'normal', codeIBNR: 789, codeEPA: 1011),
        const Station(
            name: 'Łódź', type: 'normal', codeIBNR: 123, codeEPA: 454),
      ];
      const searchText = '123';
      final filteredList = filterStationList(stations, searchText);

      expect(filteredList, equals([stations[2]]));
    });

    test('returns filtered list based on searchText', () {
      final stations = [
        const Station(
            name: 'Warszawa777', type: 'normal', codeIBNR: 122, codeEPA: 456),
        const Station(
            name: 'Wrocław', type: 'normal', codeIBNR: 789, codeEPA: 777),
        const Station(
            name: 'Łódź', type: 'normal', codeIBNR: 123, codeEPA: 454),
      ];

      final result = filterStationList(stations, '777');

      expect(result.length, equals(2));
    });
  });
}
