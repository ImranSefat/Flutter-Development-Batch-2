import 'package:firebase_auth_getx/Constants/firebase_auth_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              authController.logout();
            },
            icon: const Icon(
              Icons.power_off_sharp,
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          "Welcome user",
          style: Get.textTheme.headline3,
        ),
      ),
    );
  }
}
