import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Intro to Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // void addNumber(int a, int b) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        // centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(
          //   "Welcome to Flutter development!",
          //   style: TextStyle(
          //     fontSize: 24,
          //     // color: Colors.red,
          //     // letterSpacing: 1.3,
          //     fontWeight: FontWeight.w800,
          //   ),
          // ),
          // SvgPicture.asset("images/yacht.svg"),

          Center(
            child: Container(
              height: 240,
              width: 240,
              decoration: BoxDecoration(
                color: Color(0xffEBF7FE),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.7),
                    offset: Offset(8, 8),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SvgPicture.asset(
                  'images/yacht.svg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
