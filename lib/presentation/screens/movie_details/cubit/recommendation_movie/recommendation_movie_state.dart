import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trailer_hub/domain/movie/models/movie_model.dart';

part 'recommendation_movie_state.freezed.dart';
 
@freezed
abstract class RecommendationMovieState with _$RecommendationMovieState{
  const factory RecommendationMovieState.loading() = RecommendationMovieLoading;
  const factory RecommendationMovieState.loaded(List<MovieModel> movies) = RecommendationMovieLoaded;
  const factory RecommendationMovieState.error(String message) = RecommendationMovieError;
}