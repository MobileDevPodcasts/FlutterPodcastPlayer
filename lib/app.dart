import 'package:flutter/material.dart';
import 'package:podcast_player/main/ui/PodcastSearchScreen.dart';

//application widget
class PodcastApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcast Player',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: PodcastSearchScreen(),
    );
  }
}
