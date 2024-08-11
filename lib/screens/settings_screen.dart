import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S E T T I N G S'),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        centerTitle: true,
      ),
      // body: Column(
      //   children: [
      //     ListTile(
      //       title: const Text('Dark Mode'),
      //       trailing: CupertinoSwitch(
      //         value: true,
      //         onChanged: (value) {

      //         },
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
