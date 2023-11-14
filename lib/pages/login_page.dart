import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:varta_app/components/my_button.dart';
import 'package:varta_app/components/my_text_field.dart';
import 'package:varta_app/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signIn() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //logo
              Icon(
                Icons.message,
                size: 100,
                color: Colors.grey.shade800,
              ),
              const SizedBox(height: 25),
              //welcome back
              const Text(
                "Welcome back ... you have been missed !",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 75),
              //email
              MyTextField(
                  controller: emailController,
                  hintText: "Email here ...",
                  obscureText: false),
              const SizedBox(height: 20),
              //password
              MyTextField(
                  controller: passwordController,
                  hintText: "Password here ...",
                  obscureText: true),
              const SizedBox(height: 50),
              //sign in button
              MyButton(text: "Sign In", onTap: signIn),
              const SizedBox(height: 50),
              //not a member ? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a Member ?"),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register now.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ]),
          )),
        ));
  }
}
