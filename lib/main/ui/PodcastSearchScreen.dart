import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:podcast_player/main/ui/PodcastList.dart';

import '../blocks/PodcastsBloc.dart';

//screen with a search field and search results
class PodcastSearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PodcastSearchScreenState();
  }
}

class PodcastSearchScreenState extends State<PodcastSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dev Podcast Player'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search podcasts",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.0),
                ),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.black),
              ),
              onChanged: (text) => podcastsBloc.setSearchQuery(text),
            ),
          ),
          Expanded(
            child: PodcastList(),
          ),
        ],
      ),
    );
  }
}
