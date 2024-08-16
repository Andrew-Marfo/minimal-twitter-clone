import 'package:flutter/material.dart';
import 'package:twitter_clone/components/custom_button.dart';
import 'package:twitter_clone/components/login_textfield.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final psController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock_open,
                  size: 70,
                ),
                const SizedBox(height: 50),
                const Text('Welcome Back, Continue to Login'),
                const SizedBox(height: 30),
                LoginTextfield(
                  hintText: 'Enter Email',
                  textController: emailController,
                  obscure: false,
                ),
                const SizedBox(height: 20),
                LoginTextfield(
                  hintText: 'Password',
                  textController: psController,
                  obscure: true,
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot Password'),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
