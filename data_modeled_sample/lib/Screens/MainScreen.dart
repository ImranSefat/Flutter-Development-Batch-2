import 'package:data_modeled_sample/Models/Datamodels/FoodItemModel.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      // appBar: AppBar(
      //   title: Text("Main Screen"),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(4, 4),
                            blurRadius: 8,
                            // spreadRadius: 8
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.menu,
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.circular(8),
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Colors.black.withOpacity(0.2),
                      //       offset: Offset(4, 4),
                      //       blurRadius: 8,
                      //       // spreadRadius: 8
                      //     ),
                      //   ],
                      // ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                SecondItem(),
                SizedBox(height: 12),
                Text(
                  "Food Delivery",
                  style: TextStyle(
                    fontSize: textTheme.headline4!.fontSize,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              hintText: "Find for food or restaurants...",
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(
                            Icons.edit,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(
                            icon: Icon(Icons.add),
                            text: "Breakfast",
                          ),
                          Tab(
                            icon: Icon(
                              Icons.add,
                            ),
                            text: "Lunch",
                          ),
                          Tab(
                            icon: Icon(
                              Icons.add,
                            ),
                            text: "Dinner",
                          ),
                        ],
                      ),
                      Container(
                        height: 450,
                        child: TabBarView(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Best Restaurants",
                                      style: TextStyle(
                                        fontSize: textTheme.headline5!.fontSize,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.1,
                                      ),
                                    ),
                                    TextButton(
                                      child: Text("See All"),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                // SizedBox(height: 30),
                                Container(
                                  height: 340,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: restaurantModels.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return RestaurantCard(
                                        textTheme: textTheme,
                                        restaurantModel:
                                            restaurantModels[index],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 300,
                              color: Colors.green,
                            ),
                            Container(
                              height: 300,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurantModel;
  const RestaurantCard({
    Key? key,
    required this.textTheme,
    required this.restaurantModel,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 320,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image(
                  height: 320,
                  width: 200,
                  fit: BoxFit.cover,
                  image: AssetImage(
                    restaurantModel.image,
                  ),
                ),
              ),
              Container(
                height: 320,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                restaurantModel.rating.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    // color: Colors.white,
                                    fontSize: 10
                                    // fontSize:
                                    ),
                              ),
                              Icon(
                                Icons.star,
                                size: 12,
                                color: Colors.yellow[700],
                              ),
                              Text(
                                "(50+)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    // color: Colors.white,
                                    fontSize: 10
                                    // fontSize:
                                    ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 20,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                "AMERICAN",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 8,
                                  // fontSize:
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 20,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                "FAST FOOD",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 8,
                                  // fontSize:
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      restaurantModel.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: textTheme.headline5!.fontSize,
                        letterSpacing: 1.1,

                        // fontSize:
                      ),
                    ),
                    SizedBox(height: 6),
                    SizedBox(height: 6),
                    Text(
                      "Friends were here",
                      style: TextStyle(
                        // fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: textTheme.caption!.fontSize,
                        // letterSpacing: 1.1,

                        // fontSize:
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        dpImage(),
                        dpImage(),
                        dpImage(),
                      ],
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

dpImage() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Container(
      height: 35,
      width: 35,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(8),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.2),
      //       offset: Offset(4, 4),
      //       blurRadius: 8,
      //       // spreadRadius: 8
      //     ),
      //   ],
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
          ),
        ),
      ),
    ),
  );
}

class SecondItem extends StatefulWidget {
  @override
  _SecondItemState createState() => _SecondItemState();
}

class _SecondItemState extends State<SecondItem> {
  String dropdownValue = 'Item one';

  @override
  Widget build(BuildContext context) {
    final txTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(
          "Deliver to ",
          style: TextStyle(
            fontSize: txTheme.headline6!.fontSize,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.3,
          ),
        ),
        DropdownButton<String>(
          value: dropdownValue,
          // icon: const Icon(Icons.arrow_downward),
          // iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.orangeAccent),
          underline: Container(
            height: 0,
            // color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Item one', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
