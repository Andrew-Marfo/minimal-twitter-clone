import 'package:flutter/material.dart';
import 'package:twitter_clone/components/custom_button.dart';
import 'package:twitter_clone/components/loading_spinner.dart';
import 'package:twitter_clone/components/login_textfield.dart';
import 'package:twitter_clone/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final psController = TextEditingController();

  final _auth = AuthServices();

  void login() async {
    showLoadingSpinner(context);
    try {
      await _auth.login(
        emailController.text,
        psController.text,
      );
      if (mounted) hideLoadingSpinner(context);
    } catch (e) {
      if (mounted) hideLoadingSpinner(context);
      print(e.toString());
    }
  }

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
                Icon(
                  Icons.lock_open,
                  size: 70,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 50),
                Text(
                  'Welcome Back, Continue to Login',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: login,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?'),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Register now'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
