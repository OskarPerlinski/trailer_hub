import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trailer_hub/domain/movie/models/movie_list.dart';
import 'package:trailer_hub/domain/movie/repository/movie_repository.dart';
import 'package:trailer_hub/presentation/screens/home/cubit/movies_action.dart';
import 'package:trailer_hub/presentation/screens/home/cubit/movies_state.dart';

@injectable
class MoviesCubit extends ActionCubit<MoviesState, MoviesAction> {
  MoviesCubit(this._movieRepository) : super(MoviesState.loading());

  final MovieRepository _movieRepository;

  Future<void> getMovieList(MovieListType type) async {
    emit(const MoviesState.loading());
    try {
      final movies = await _movieRepository.getMovieList(type);
      emit(MoviesState.loaded(movies));
    } catch (e) {
      emit(const MoviesState.error('Failed to load movies.'));
    }
  }

  void navigateToDetails(int movieId) {
    dispatch(MoviesAction.navigateToDetails(movieId));
  }
}
