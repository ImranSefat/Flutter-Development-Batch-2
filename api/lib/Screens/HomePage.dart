import 'dart:convert';

import 'package:api/models/NasaApodModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NasaApodModel> fetchData() async {
    final response = await http.get(
      Uri.parse('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY'),
    );
    return NasaApodModel.fromJson(jsonDecode(response.body));
    // final datamodel = NasaApodModel.fromJson(jsonDecode(response.body));
    // return datamodel;
  }

  @override
  void initState() {
    super.initState();

    nasaData = fetchData();
  }

  late Future<NasaApodModel> nasaData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NASA Astronomy"),
      ),
      body: FutureBuilder<NasaApodModel>(
        future: nasaData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final result = snapshot.data!;

            return ResultView(result: result);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return Center(
            child: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ResultView extends StatelessWidget {
  const ResultView({
    Key? key,
    required this.result,
  }) : super(key: key);

  final NasaApodModel result;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: result.hdurl!,
          placeholder: (context, url) => Center(
            child: Lottie.asset(
              'lotties/loading.json',
              height: 300,
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  result.title!,
                  style: TextStyle(
                    fontSize: textTheme.headline3!.fontSize,
                    // color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  "Date: " + result.date!,
                  style: textTheme.headline6,
                ),
              ),
              Opacity(
                opacity: 0.7,
                child: Text(
                  result.explanation!,
                  textAlign: TextAlign.justify,
                  style: textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
