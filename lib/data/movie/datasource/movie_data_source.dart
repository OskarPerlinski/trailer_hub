import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:trailer_hub/core/network/dio_client.dart';
import 'package:trailer_hub/domain/movie/models/movie_list.dart';

@singleton
class MovieDataSource {
  MovieDataSource(this._dio);

  final DioClient _dio;

  Future<Response> getMovieList(MovieListType type) async {
    return await _dio.get("/${type.pathName}");
  }
}
