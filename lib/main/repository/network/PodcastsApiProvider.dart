import 'dart:convert';

import 'package:http/http.dart';
import 'package:podcast_player/base/models/PodcastListReponse.dart';
import 'package:podcast_player/main/repository/network/ServerUrls.dart';

//podcasts network data provider
class PodcastsApiProvider {
  Client client = Client();

  //fetch podcasts matching 'Android' keyword todo temporary hardcoded URL
  Future<PodcastListResponse> fetchPodcasts() async {
    final response = await client.get(getPodcastsUrl);
    if (response.statusCode == 200) {
      return PodcastListResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
