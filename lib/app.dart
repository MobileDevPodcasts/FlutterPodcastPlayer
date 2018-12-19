import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:podcast_player/network/ServerUrls.dart';

//application widget
class PodcastApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcast Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Podcast Player"),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          fetchData();
        }),
      ),
    );
  }

  void fetchData() {
    get(getPodcastsUrl).then((response) {
      print(response.body);
    });
  }
}