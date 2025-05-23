import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';

@freezed
abstract class MovieModel with _$MovieModel {
  const factory MovieModel({
    String? backdropPath,
    required int id,
    required String title,
    required String originalTitle,
    required String overview,
    required String posterPath,
    String? mediaType,
    required bool adult,
    required String originalLanguage,
    required List<int> genreIds,
    required double popularity,
    required DateTime releaseDate,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) = _MovieModel;
}
