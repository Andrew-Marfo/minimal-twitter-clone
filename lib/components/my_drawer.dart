import 'package:flutter/material.dart';
import 'package:twitter_clone/components/my_drawer_list_tile.dart';
import 'package:twitter_clone/screens/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Icon(
                Icons.people,
                size: 80,
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              color: Theme.of(context).colorScheme.secondary,
            ),
            MyDrawerListTile(
              icon: Icons.home,
              title: 'H O M E',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            MyDrawerListTile(
              icon: Icons.settings,
              title: 'S E T T I N G S',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SettingsScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
