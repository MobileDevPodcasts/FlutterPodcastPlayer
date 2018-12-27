//server urls list
//we are using iTunes Search API in this project to fetch podcasts
//https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/

//format URL to fetch podcasts list by the keyword [searchQuery]
String getPodcastsUrl(String searchQuery) {
  return "https://itunes.apple.com/search?term=$searchQuery&entity=podcast";
}
