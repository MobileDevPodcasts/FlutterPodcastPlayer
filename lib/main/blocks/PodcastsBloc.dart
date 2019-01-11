import 'package:podcast_player/base/models/PodcastListReponse.dart';
import 'package:podcast_player/main/repository/PodcastsRepository.dart';
import 'package:rxdart/rxdart.dart';

//podcasts BLOC layer
class PodcastsBloc {
  PodcastsBloc() {
    _searchQuerySubject.stream
        .debounce(new Duration(milliseconds: 300))
        .listen((text) => podcastsBloc.searchQuery = text);
  }

  final _podcastsRepository = PodcastsRepository();
  final _podcastsFetcher = PublishSubject<PodcastListResponse>();
  final _searchQuerySubject = new PublishSubject<String>();

  String _searchQuery;

  String get searchQuery => _searchQuery;

  set searchQuery(String searchQuery) {
    _searchQuery = searchQuery;
    fetchPodcasts();
  }

  Observable<PodcastListResponse> get podcastListResponse =>
      _podcastsFetcher.stream;

  setSearchQuery(String searchQuery) {
    _searchQuerySubject.add(searchQuery);
  }

  fetchPodcasts() async {
    PodcastListResponse podcastListResponse =
        await _podcastsRepository.fetchPodcasts(searchQuery);
    _podcastsFetcher.sink.add(podcastListResponse);
  }

  dispose() {
    _podcastsFetcher.close();
    _searchQuerySubject.close();
  }
}

final podcastsBloc = PodcastsBloc();
