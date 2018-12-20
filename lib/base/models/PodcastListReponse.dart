import 'package:podcast_player/base/models/Podcast.dart';

//podcasts list response data model
class PodcastListResponse {
  int _resultCount;
  List<Podcast> _podcasts = [];

  PodcastListResponse.fromJson(Map<String, dynamic> parsedJson) {
    _resultCount = parsedJson['resultCount'];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _podcasts.add(Podcast(parsedJson['results'][i]));
    }
  }
}
