import 'package:injectable/injectable.dart';
import 'package:trailer_hub/data/video/datasource/video_data_source.dart';
import 'package:trailer_hub/data/video/dto/video_model_dto.dart';
import 'package:trailer_hub/data/video/mapper/video_mapper.dart';
import 'package:trailer_hub/domain/video/models/video_model.dart';
import 'package:trailer_hub/domain/video/repository/video_repository.dart';

@Singleton(as: VideoRepository)
class VideoRepositoryImpl implements VideoRepository {
  VideoRepositoryImpl(this._videoDataSource, this._videoMapper);

  final VideoDataSource _videoDataSource;
  final VideoMapper _videoMapper;

  @override
  Future<List<VideoModel>> getMovieTrailer(int movieId) async {
    final response = await _videoDataSource.getMovieTrailer(movieId);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      final List<dynamic> trailerDtos = data['results'] as List<dynamic>;

      final List<VideoModel> trailers =
          trailerDtos
              .map(
                (dto) => VideoModelDto.fromJson(dto as Map<String, dynamic>),
              )
              .where((dto) => dto.type?.toLowerCase() == 'trailer')
              .map(_videoMapper.toDomain)
              .toList();

      return trailers;
    } else {
      throw Exception('Failed to load trailer: ${response.statusCode}');
    }
  }
}
