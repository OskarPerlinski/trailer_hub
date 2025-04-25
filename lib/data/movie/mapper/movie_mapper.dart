import 'package:injectable/injectable.dart';
import 'package:trailer_hub/data/movie/dto/movie_model_dto.dart';
import 'package:trailer_hub/domain/movie/models/movie_model.dart';

@injectable
class MovieMapper {
  MovieModelDto toDto(MovieModel movie) {
    return MovieModelDto(
      backdropPath: movie.backdropPath,
      id: movie.id,
      title: movie.title,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      posterPath: movie.posterPath,
      mediaType: movie.mediaType,
      adult: movie.adult,
      originalLanguage: movie.originalLanguage,
      genreIds: movie.genreIds,
      popularity: movie.popularity,
      releaseDate: movie.releaseDate,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }

  MovieModel toDomain(MovieModelDto dto) {
    return MovieModel(
      backdropPath: dto.backdropPath,
      id: dto.id,
      title: dto.title,
      originalTitle: dto.originalTitle,
      overview: dto.overview,
      posterPath: dto.posterPath,
      mediaType: dto.mediaType,
      adult: dto.adult,
      originalLanguage: dto.originalLanguage,
      genreIds: dto.genreIds,
      popularity: dto.popularity,
      releaseDate: dto.releaseDate,
      video: dto.video,
      voteAverage: dto.voteAverage,
      voteCount: dto.voteCount,
    );
  }
}
