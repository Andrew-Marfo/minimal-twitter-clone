import 'package:flutter/material.dart';
import 'package:twitter_clone/components/custom_button.dart';
import 'package:twitter_clone/components/login_textfield.dart';

class RegisterPage extends StatelessWidget {
  final emailController = TextEditingController();
  final psController = TextEditingController();
  final confirmPsController = TextEditingController();
  final void Function()? onTap;
  RegisterPage({
    super.key,
    required this.onTap,
  });

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
                  hintText: 'Enter Name',
                  textController: emailController,
                  obscure: false,
                ),
                const SizedBox(height: 20),
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
                LoginTextfield(
                  hintText: 'Confirm Password',
                  textController: confirmPsController,
                  obscure: true,
                ),
                const SizedBox(height: 20),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Text(
                //     'Forgot Password?',
                //     style: TextStyle(
                //       color: Theme.of(context).colorScheme.primary,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () {},
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: onTap,
                      child: const Text('Login here'),
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
