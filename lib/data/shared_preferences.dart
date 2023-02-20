import 'package:shared_preferences/shared_preferences.dart';

// Zakładamy że nazwa stacji jest unikalna,
// Nazwa dodana do shared preferences
// Inne rozwiązania to zapisać cały obiekt, id, lub index

Future<void> saveLastSelectedStation(String nameOfStation) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('lastSelectedStation', nameOfStation);
}

Future<void> getLastSelectedStation() async {
  final prefs = await SharedPreferences.getInstance();
  String result = prefs.getString('lastSelectedStation') ?? 'null';
  // ignore: avoid_print
  print('Last checked station: $result');
}
