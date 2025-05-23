import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trailer_hub/domain/video/repository/video_repository.dart';
import 'package:trailer_hub/presentation/screens/movie_details/cubit/video/video_state.dart';

@injectable
class VideoCubit extends Cubit<VideoState> {
  VideoCubit(this._videoRepository) : super(VideoState.loading());

  final VideoRepository _videoRepository;

  Future<void> getMovieTrailer(int movieId) async {
    emit(VideoState.loading());
    try {
      final trailers = await _videoRepository.getMovieTrailer(movieId);
      final trailer = trailers.firstOrNull;

      if (trailer != null && trailer.key != null && trailer.key!.isNotEmpty) {
        emit(VideoState.loaded(trailer.key!));
      } else {
        emit(VideoState.error('Failed to load trailer.'));
      }
    } catch (e) {
      emit(VideoState.error('Error: ${e.toString()}'));
    }
  }
}
