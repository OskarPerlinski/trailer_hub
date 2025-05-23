import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation_movie_action.freezed.dart';

@freezed
abstract class RecommendationMovieAction with _$RecommendationMovieAction {
const factory RecommendationMovieAction.navigateToDetail(int movieId) = RecommendationMovieNavigateToDetail;
}