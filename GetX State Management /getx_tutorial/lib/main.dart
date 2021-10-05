import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/DetailsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  void _goToSecondPage() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => DetailPage(),
    //   ),
    // );

    Get.to(() => DetailPage());
  }

  void _showSnackBar() {
    Get.snackbar(
      "Coding with Imran",
      "This is the details!",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.black,
      margin: EdgeInsets.all(12),
      // snackStyle: SnackStyle.GROUNDED,
    );
  }

  void _showDialogue() {
    Get.defaultDialog(
      title: "Warning!",
      textConfirm: "Confirm",
      textCancel: "Cancel",
      content: Text("Wrong Password!"),
      // barrierDismissible: false,
      // confirm: Text("Confirm"),
      onConfirm: () {
        // Get.back();
        print("Confirmed");
      },
      // cancel: Text("Cancel"),
      onCancel: () {
        print("Cancelled");
      },
    );
  }

  void _showBottomSheet() {
    Get.bottomSheet(
      Container(
        // width: Get.width / 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        height: Get.height / 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: 60,
                height: 7,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Text("asdasdasd"),
            Text("asdasdasd"),
            Text("asdasdasd"),
            Text("asdasdasd"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _goToSecondPage,
                child: Text(
                  "Go to Details page",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _showSnackBar,
                child: Text(
                  "Show Snackbar",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _showDialogue,
                child: Text(
                  "Show Dialogue",
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _showBottomSheet,
                child: Text(
                  "Show Bottom Sheet",
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
