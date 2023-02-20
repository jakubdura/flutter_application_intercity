import 'package:flutter/material.dart';

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
