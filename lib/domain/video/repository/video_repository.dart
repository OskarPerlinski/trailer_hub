import 'package:trailer_hub/domain/video/models/video_model.dart';

abstract class VideoRepository {
  Future<List<VideoModel>> getMovieTrailer(int movieId);
}