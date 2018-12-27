import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:podcast_player/base/models/PodcastListReponse.dart';

import '../blocks/PodcastsBloc.dart';

//podcast list screen
class PodcastList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PodcastListState();
  }
}

//podcast list screen state
class PodcastListState extends State<PodcastList> {
  @override
  Widget build(BuildContext context) {
    podcastsBloc.fetchPodcasts();
    return StreamBuilder(
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
        });
  }

  @override
  void dispose() {
    super.dispose();
    podcastsBloc.dispose();
  }

  Widget buildList(AsyncSnapshot<PodcastListResponse> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.podcasts.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(snapshot.data.podcasts[index].collectionName);
        });
  }
}
