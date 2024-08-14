import 'package:flutter/material.dart';
import 'package:twitter_clone/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('H O M E'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      drawer: const MyDrawer(),
    );
  }
}
