import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySettingsListTile extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool) onChanged;
  const MySettingsListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
