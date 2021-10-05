import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controllers/CounterController.dart';
import 'package:getx_tutorial/controllers/UserController.dart';

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
      home: MyHomePageStless(),
    );
  }
}

class MyHomePageStless extends StatelessWidget {
  // final CounterController _counterController = Get.put(CounterController());

  final data = "This is a sample data".obs;

  final age = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data.value),
            Obx(() {
              return Text(data.value);
            }),
            TextButton(
              onPressed: () {
                data.value = "Updated";
              },
              child: Text("Change data"),
            ),
          ],
        ),
      ),

      // GetX<UserController>(
      //   init: UserController(),
      //   builder: (userController) {
      //     return Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           GetBuilder<CounterController>(
      //             init: CounterController(),
      //             builder: (counterController) {
      //               return Text(
      //                 '${userController.user.value.name} has pushed the button this many times: ${counterController.counter}',
      //               );
      //             },
      //           ),
      //           // Text("" + userController.user.value.name),
      //           TextField(
      //             onChanged: (value) => data = value,
      //           ),
      //           TextButton(
      //             onPressed: () {
      //               userController.user.update((val) {
      //                 val!.name = data;
      //               });
      //             },
      //             child: Text("Change Name"),
      //           ),
      //           Obx(
      //             () {
      //               return Text(
      //                 "Counter Value : ${Get.find<UserController>().user.value.age}",
      //               );
      //             },
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 12.0),
      //       child: FloatingActionButton(
      //         onPressed: () {
      //           Get.find<CounterController>().increment();
      //         },
      //         tooltip: 'Increment',
      //         child: Icon(Icons.add),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 12.0),
      //       child: FloatingActionButton(
      //         onPressed: () {
      //           Get.find<CounterController>().decrement();
      //         },
      //         tooltip: 'Decrement',
      //         child: Icon(Icons.remove),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}



// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final CounterController _counterController = Get.put(CounterController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             GetBuilder<CounterController>(
//               builder: (_) {
//                 return Text(
//                   'You have pushed the button this many times: ${_counterController.counter}',
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _counterController.increment();
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
