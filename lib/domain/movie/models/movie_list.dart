enum MovieListType {
  nowPlaying("now_playing"),
  popular("popular"),
  topRated("top_rated"),
  upcoming("upcoming");

  const MovieListType(this.pathName);
  final String pathName;
}
