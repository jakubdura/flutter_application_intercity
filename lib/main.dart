import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const FirstWidget(),
    );
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MyListTile(
            title: "My task title",
            subtitle: "subtitle",
          ),
          Text(
            AppLocalizations.of(context).helloWorld,
            style: const TextStyle(color: Colors.red, fontSize: 50),
          ),
          const Text(
            'New Text 2',
            style: TextStyle(color: Colors.red, fontSize: 50),
          ),
        ],
      ),
    );
  }
}

class MyListTile extends StatefulWidget {
  MyListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  bool checkboxValue = false;

  final String title;
  final String subtitle;

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: (value) => setState(() {
          widget.checkboxValue = value ?? false;
        }),
        value: widget.checkboxValue,
      ),
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      trailing: const Icon(Icons.abc),
      style: ListTileStyle.list,
    );
  }
}
