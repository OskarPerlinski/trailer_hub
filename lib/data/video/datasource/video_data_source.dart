import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:trailer_hub/core/network/dio_client.dart';

@singleton
class VideoDataSource {
  VideoDataSource(this._dio);

  final DioClient _dio;

  Future<Response> getMovieTrailer(int movieId) async {
    return await _dio.get('/$movieId/videos');
  }
}
