import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trailer_hub/domain/movie/repository/movie_repository.dart';
import 'package:trailer_hub/presentation/screens/movie_details/cubit/recommendation_movie/recommendation_movie_action.dart';
import 'package:trailer_hub/presentation/screens/movie_details/cubit/recommendation_movie/recommendation_movie_state.dart';

@injectable
class RecommendationMovieCubit
    extends ActionCubit<RecommendationMovieState, RecommendationMovieAction> {
  RecommendationMovieCubit(this._movieRepository)
    : super(RecommendationMovieState.loading());

  final MovieRepository _movieRepository;

  Future<void> getRecommendationMovies(int movieId) async {
    emit(RecommendationMovieState.loading());
    try {
      final movies = await _movieRepository.getRecommendationMovies(movieId);
      emit(RecommendationMovieState.loaded(movies));
    } catch (e) {
      emit(RecommendationMovieState.error('Failed to load movies.'));
    }
  }

  void navigateToDetails(int movieId) {
    dispatch(RecommendationMovieAction.navigateToDetail(movieId));
  }
}
