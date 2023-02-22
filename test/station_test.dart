import 'package:flutter_application_intercity/data/station.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Station with required parameters', () {
    late Station station;

    setUp(() {
      station = const Station(
        name: 'Warszawaa',
        type: 'normal',
        codeIBNR: 12345,
      );
    });

    test('should have a name', () {
      expect(station.name, isNotEmpty);
    });

    test('should have a type', () {
      expect(station.type, isNotEmpty);
    });

    test('should have IBNR code', () {
      expect(station.codeIBNR, isPositive);
    });

    test('shouldnt have EPA code', () {
      expect(station.codeEPA, isNull);
    });
  });

  group('Station with optional codeEPA parameter', () {
    late Station station;

    setUp(() {
      station = const Station(
        name: 'Warszawaa',
        type: 'normal',
        codeIBNR: 12345,
        codeEPA: 5555,
      );
    });

    test('should have optional EPA code', () {
      expect(station.codeEPA, isNotNull);
      expect(station.codeEPA, isPositive);
    });
  });
}
