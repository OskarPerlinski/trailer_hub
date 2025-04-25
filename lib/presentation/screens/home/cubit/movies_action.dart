import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_action.freezed.dart';

@freezed
abstract class MoviesAction with _$MoviesAction{
  const factory MoviesAction.navigateToDetails(int movieId) = MoviesNavigateToDetails;
}