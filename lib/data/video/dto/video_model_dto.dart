import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model_dto.freezed.dart';
part 'video_model_dto.g.dart';

@freezed
abstract class VideoModelDto with _$VideoModelDto {
  const factory VideoModelDto({
    final String? iso6391,
    final String? iso31661,
    final String? name,
    final String? key,
    final String? site,
    final int? size,
    final String? type,
    final bool? official,
    final DateTime? publishedAt,
    final String? id,
  }) = _VideoModelDto;

  factory VideoModelDto.fromJson(Map<String, dynamic> json) => 
      _$VideoModelDtoFromJson(json);
}
