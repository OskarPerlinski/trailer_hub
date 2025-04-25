import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model_dto.freezed.dart';
part 'movie_model_dto.g.dart';

@freezed
abstract class MovieModelDto with _$MovieModelDto {
  const factory MovieModelDto({
    String? backdropPath,
    int? id,
    String? title,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? mediaType,
    bool? adult,
    String? originalLanguage,
    @Default([]) List<int> genreIds,
    double? popularity,
    DateTime? releaseDate,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) = _MovieModelDto;

  factory MovieModelDto.fromJson(Map<String, dynamic> json) => 
      _$MovieModelDtoFromJson(json);
}