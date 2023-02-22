import 'package:flutter/material.dart';
import 'package:flutter_application_intercity/data/station.dart';
import 'package:flutter_application_intercity/view/list_tile.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ListStationTile displays station data',
      (WidgetTester tester) async {
    // Create a station instance to pass to the widget
    const Station station = Station(
      name: 'Warszawa',
      type: 'normal',
      codeIBNR: 1111,
      codeEPA: 2222,
    );

    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ListStationTile(station: station),
        ),
      ),
    );

    // Find the ListTile within the widget tree
    find.byType(ListTile).evaluate().first.widget as ListTile;

    // Check that the ListTile displays the correct data
    expect(find.text('Warszawa'), findsOneWidget);
    expect(find.text('IBNR: ${station.codeIBNR}'), findsOneWidget);
    expect(find.text('EPA: 2222'), findsOneWidget);
  });

  testWidgets('Shouldnt display EPA TextWidget if codeEPA is null',
      (WidgetTester tester) async {
    const station = Station(
      name: 'Warszawa',
      type: 'normal',
      codeIBNR: 123,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ListStationTile(station: station),
        ),
      ),
    );
    expect(find.text('Warszawa'), findsOneWidget);
    expect(find.text('IBNR: ${station.codeIBNR}'), findsOneWidget);
    expect(find.text('EPA:'), findsNothing);
  });

  group("nullEpaSizedBox display depending on the optional codeEPA parameter",
      () {
    testWidgets('Should display SizedBox if codeEPA is null',
        (WidgetTester tester) async {
      const station = Station(
        name: 'Test Station',
        type: 'normal',
        codeIBNR: 123,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ListStationTile(station: station),
          ),
        ),
      );

      expect(find.byKey(const ValueKey('nullEpaSizedBox')), findsOneWidget);
    });

    testWidgets('Shouldnt display SizedBox if codeEPA exist',
        (WidgetTester tester) async {
      const station = Station(
        name: 'Test Station',
        type: 'normal',
        codeIBNR: 123,
        codeEPA: 3333,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ListStationTile(station: station),
          ),
        ),
      );

      expect(find.byKey(const ValueKey('nullEpaSizedBox')), findsNothing);
    });
  });

  testWidgets('ListStationTile displays snackbar when tapped',
      (WidgetTester tester) async {
    const station = Station(
      name: 'Warszawa Włochy',
      type: 'normal',
      codeIBNR: 12345,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ListStationTile(station: station),
        ),
      ),
    );

    // Tap the ListTile
    await tester.tap(find.byType(ListTile));
    await tester.pump();

    // Check that a SnackBar is displayed with the correct message
    expect(find.text('Wybrano stacje: Warszawa Włochy'), findsOneWidget);
  });
}
