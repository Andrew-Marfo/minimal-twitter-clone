import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:twitter_clone/screens/homepage.dart';
import 'package:twitter_clone/screens/login_page.dart';
import 'package:twitter_clone/services/auth/register_login.dart';
import 'package:twitter_clone/themes/theme_provider.dart';

import 'screens/register_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterLogin(),
      theme: Provider.of<ThemeProvider>(
        context,
      ).themeData,
    );
  }
}
