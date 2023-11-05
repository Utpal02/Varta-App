import 'package:flutter/material.dart';
import 'package:varta_app/components/my_text_field.dart';
import '../components/my_button.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  //sign up user
  void signUp() {}
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
              //Let's create an account for you
              const Text(
                "Let's create an account for you !",
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
              const SizedBox(height: 20),
              //confirm password
              MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true),
              const SizedBox(height: 50),
              //sign up button
              MyButton(text: "Sign Up", onTap: signUp),
              const SizedBox(height: 50),
              //Already a member ? Login now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already a member ?"),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Login now.",
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
