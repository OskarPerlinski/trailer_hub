import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trailer_hub/domain/movie/models/movie_model.dart';

part 'movies_state.freezed.dart';

@freezed
abstract class MoviesState with _$MoviesState {
  const factory MoviesState.loading() = MoviesLoading;
  const factory MoviesState.loaded(List<MovieModel> movies) = MoviesLoaded;
  const factory MoviesState.error(String message) = MoviesError;
}
