import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_state.freezed.dart';

@freezed
abstract class VideoState with _$VideoState {
  const factory VideoState.loading() = VideoLoading;
  const factory VideoState.loaded(String videoId) = VideoLoaded;
  const factory VideoState.error(String message) = VideoError;
}