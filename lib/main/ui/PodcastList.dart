import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:podcast_player/base/models/PodcastListReponse.dart';

import '../blocks/PodcastsBloc.dart';

class PodcastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    podcastsBloc.fetchPodcasts();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dev Podcast Player'),
      ),
      body: StreamBuilder(
          stream: podcastsBloc.podcastListResponse,
          builder: (context, AsyncSnapshot<PodcastListResponse> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              Text(snapshot.error.toString());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Widget buildList(AsyncSnapshot<PodcastListResponse> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.podcasts.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Text(snapshot.data.podcasts[index].collectionName);
        });
  }
}
