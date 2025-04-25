import 'package:injectable/injectable.dart';
import 'package:trailer_hub/data/movie/datasource/movie_data_source.dart';
import 'package:trailer_hub/data/movie/dto/movie_model_dto.dart';
import 'package:trailer_hub/data/movie/mapper/movie_mapper.dart';
import 'package:trailer_hub/domain/movie/models/movie_list.dart';
import 'package:trailer_hub/domain/movie/models/movie_model.dart';
import 'package:trailer_hub/domain/movie/repository/movie_repository.dart';

@Singleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource, this._movieMapper);

  final MovieDataSource _movieDataSource;
  final MovieMapper _movieMapper;

  @override
  Future<List<MovieModel>> getMovieList(MovieListType type) async {
    final response = await _movieDataSource.getMovieList(type);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      final List<dynamic> movieDtos = data['results'] as List<dynamic>;

      final List<MovieModel> movies =
          movieDtos
              .map((dto) => MovieModelDto.fromJson(dto as Map<String, dynamic>))
              .map(_movieMapper.toDomain)
              .toList();

      return movies;
    } else {
      throw Exception('Failed to load movies: ${response.statusCode}');
    }
  }
}
