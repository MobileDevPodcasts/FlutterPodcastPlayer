import 'package:podcast_player/base/models/PodcastListReponse.dart';
import 'package:podcast_player/main/repository/PodcastsRepository.dart';
import 'package:rxdart/rxdart.dart';

//podcasts BLOC layer
class PodcastsBloc {
  final _podcastsRepository = PodcastsRepository();
  final _podcastsFetcher = PublishSubject<PodcastListResponse>();

  String _searchQuery;

  String get searchQuery => _searchQuery;

  set searchQuery(String searchQuery) {
    _searchQuery = searchQuery;
    fetchPodcasts();
  }

  Observable<PodcastListResponse> get podcastListResponse =>
      _podcastsFetcher.stream;

  fetchPodcasts() async {
    PodcastListResponse podcastListResponse =
        await _podcastsRepository.fetchPodcasts(searchQuery);
    _podcastsFetcher.sink.add(podcastListResponse);
  }

  dispose() {
    _podcastsFetcher.close();
  }
}

final podcastsBloc = PodcastsBloc();
