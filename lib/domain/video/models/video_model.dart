import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.freezed.dart';

@freezed
abstract class VideoModel with _$VideoModel {
  const factory VideoModel({
    required String? iso6391,
    required String? iso31661,
    required String? name,
    required String? key,
    required String? site,
    required int? size,
    required String? type,
    required bool? official,
    required DateTime? publishedAt,
    required String? id,
  }) = _VideoModel;
}