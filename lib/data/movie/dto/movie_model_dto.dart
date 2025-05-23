import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model_dto.freezed.dart';
part 'movie_model_dto.g.dart';

@freezed
abstract class MovieModelDto with _$MovieModelDto {
  const factory MovieModelDto({
    String? backdropPath,
    required int id,
    required String title,
    required String originalTitle,
    required String overview,
    required String posterPath,
    String? mediaType,
    required bool adult,
    required String originalLanguage,
    @Default([]) List<int> genreIds,
    required double popularity,
    required DateTime releaseDate,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) = _MovieModelDto;

  factory MovieModelDto.fromJson(Map<String, dynamic> json) =>
      _$MovieModelDtoFromJson(json);
}
