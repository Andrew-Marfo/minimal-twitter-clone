import 'package:flutter/material.dart';
import 'package:twitter_clone/components/my_drawer_list_tile.dart';
import 'package:twitter_clone/pages/profile_page.dart';
import 'package:twitter_clone/pages/settings_page.dart';
import 'package:twitter_clone/services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final _auth = AuthServices();

  void logout() async {
    await _auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
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
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(height: 20),
              MyDrawerListTile(
                icon: Icons.home,
                title: 'H O M E',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              MyDrawerListTile(
                icon: Icons.person,
                title: 'P R O F I L E',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfilePage(
                          uid: _auth.getCurrentUid(),
                        );
                      },
                    ),
                  );
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
                        return const SettingsPage();
                      },
                    ),
                  );
                },
              ),
              const Spacer(),
              MyDrawerListTile(
                icon: Icons.logout,
                title: 'L O G O U T',
                onTap: logout,
              )
            ],
          ),
        ),
      ),
    );
  }
}
