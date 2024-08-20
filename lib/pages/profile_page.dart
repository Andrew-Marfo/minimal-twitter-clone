import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/components/bio_box.dart';
import 'package:twitter_clone/models/user_model.dart';
import 'package:twitter_clone/services/auth/auth_services.dart';
import 'package:twitter_clone/services/database/database_provider.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({
    super.key,
    required this.uid,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);

  UserProfile? user;
  String currentUserUid = AuthServices().getCurrentUid();

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    user = await databaseProvider.userProfile(widget.uid);
    setState(() {
      isLoading = false;
    });
  }

  void _showEditBox() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Edit Bio'),
          content: TextField(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(isLoading ? '' : user!.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            // username
            Center(
              child: Text(
                isLoading ? '' : '@${user!.username}',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(height: 20),

            // profile picture
            Center(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.person,
                  size: 75,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Edit bio row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bio',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                IconButton(
                  onPressed: _showEditBox,
                  icon: Icon(
                    Icons.edit,
                    size: 17,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
            ),
            // const SizedBox(height: 5),

            // bio
            BioBox(text: isLoading ? "" : user!.bio)
          ],
        ),
      ),
    );
  }
}
