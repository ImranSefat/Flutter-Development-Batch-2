import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String name;
  const DetailsPage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Welcome to the second page $name",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go back"),
          ),
        ],
      ),
    );
  }
}
