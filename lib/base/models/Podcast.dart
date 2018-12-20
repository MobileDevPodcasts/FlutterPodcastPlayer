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
}
