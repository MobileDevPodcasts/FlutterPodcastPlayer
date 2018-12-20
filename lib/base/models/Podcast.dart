//podcast data model
class Podcast {
  int _collectionId;
  String _collectionName;
  String _feedUrl;
  String _artworkUrl60;
  int _trackCount;
  String _country;
  String _contentAdvisoryRating;
  List<String> _genres = [];

  Podcast(result) {
    _collectionId = result['collectionId'];
    _collectionName = result['collectionName'];
    _feedUrl = result['feedUrl'];
    _artworkUrl60 = result['artworkUrl60'];
    _trackCount = result['trackCount'];
    _country = result['country'];
    _contentAdvisoryRating = result['contentAdvisoryRating'];
    for (int i = 0; i < result['genres'].length; i++) {
      _genres.add(result['genres'][i]);
    }
  }

  int get collectionId => _collectionId;

  String get collectionName => _collectionName;

  String get feedUrl => _feedUrl;

  String get artworkUrl60 => _artworkUrl60;

  int get trackCount => _trackCount;

  String get country => _country;

  String get contentAdvisoryRating => _contentAdvisoryRating;

  List<String> get genres => _genres;
}
