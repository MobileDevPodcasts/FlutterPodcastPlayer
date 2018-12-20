import 'package:podcast_player/base/models/PodcastListReponse.dart';
import 'package:podcast_player/main/repository/network/PodcastsApiProvider.dart';

//podcasts data provider
class PodcastsRepository {
  final podcastsApiProvider = PodcastsApiProvider();

  Future<PodcastListResponse> fetchPodcasts() =>
      podcastsApiProvider.fetchPodcasts();
}
