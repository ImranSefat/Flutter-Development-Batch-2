import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Home Page",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                labelText: "Name",
                suffixIcon: Icon(Icons.text_fields),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // print(name);
              Navigator.pushNamed(
                context,
                '/second',
                arguments: name,
              );
            },
            child: Text("Go to detail page"),
          ),
        ],
      ),
    );
  }
}
