import 'package:flutter/material.dart';
import 'package:twitter_clone/components/custom_button.dart';
import 'package:twitter_clone/components/loading_spinner.dart';
import 'package:twitter_clone/components/login_textfield.dart';
import 'package:twitter_clone/services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final psController = TextEditingController();
  final confirmPsController = TextEditingController();
  final _auth = AuthServices();

  void register() async {
    showLoadingSpinner(context);
    if (emailController.text.isEmpty ||
        psController.text.isEmpty ||
        confirmPsController.text.isEmpty ||
        psController.text != psController.text) {
      hideLoadingSpinner(context);
      return showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Something Occured'),
            content: Text('Please Enter valid credentials'),
          );
        },
      );
    } else {
      try {
        await _auth.createAccount(
          emailController.text,
          psController.text,
        );
        if (mounted) hideLoadingSpinner(context);
      } catch (e) {
        if (mounted) hideLoadingSpinner(context);
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Something Occured'),
                content: Text(e.toString()),
              );
            },
          );
        }
      }
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
            child: SingleChildScrollView(
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
                    textController: nameController,
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
                    label: 'Register',
                    onTap: register,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text('Login here'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
