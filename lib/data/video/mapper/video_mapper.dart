import 'package:injectable/injectable.dart';
import 'package:trailer_hub/data/video/dto/video_model_dto.dart';
import 'package:trailer_hub/domain/video/models/video_model.dart';

@injectable
class VideoMapper {
  VideoModelDto toDto(VideoModel video) {
    return VideoModelDto(
      iso6391: video.iso6391,
      iso31661: video.iso31661,
      name: video.name,
      key: video.key,
      site: video.site,
      size: video.size,
      type: video.type,
      official: video.official,
      publishedAt: video.publishedAt,
      id: video.id,
    );
  }

  VideoModel toDomain(VideoModelDto dto) {
    return VideoModel(
      iso6391: dto.iso6391,
      iso31661: dto.iso31661,
      name: dto.name,
      key: dto.key,
      site: dto.site,
      size: dto.size,
      type: dto.type,
      official: dto.official,
      publishedAt: dto.publishedAt,
      id: dto.id,
    );
  }
}
