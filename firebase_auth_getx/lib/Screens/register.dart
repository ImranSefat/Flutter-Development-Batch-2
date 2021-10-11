import 'package:firebase_auth_getx/Constants/firebase_auth_constants.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailTexteditingController = TextEditingController();

  final passwordTexteditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailTexteditingController,
            ),
            TextField(
              obscureText: true,
              controller: passwordTexteditingController,
            ),
            ElevatedButton(
              onPressed: () {
                authController.register(
                  emailTexteditingController.text.trim(),
                  passwordTexteditingController.text.trim(),
                );
              },
              child: const Text("Register"),
            ),
            ElevatedButton(
              onPressed: () {
                authController.login(
                  emailTexteditingController.text.trim(),
                  passwordTexteditingController.text.trim(),
                );
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
