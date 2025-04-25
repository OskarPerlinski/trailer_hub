import 'package:trailer_hub/domain/movie/models/movie_list.dart';
import 'package:trailer_hub/domain/movie/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getMovieList(MovieListType type);
}