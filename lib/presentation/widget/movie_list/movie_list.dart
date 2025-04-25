import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:trailer_hub/domain/movie/models/movie_list.dart';
import 'package:trailer_hub/presentation/assets/app_assets.dart';
import 'package:trailer_hub/presentation/screens/home/cubit/movies_action.dart';
import 'package:trailer_hub/presentation/screens/home/cubit/movies_cubit.dart';
import 'package:trailer_hub/presentation/screens/home/cubit/movies_state.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';
import 'package:trailer_hub/presentation/theme/app_spacings.dart';
import 'package:trailer_hub/presentation/theme/app_typography.dart';

class MovieList extends HookWidget {
  const MovieList({super.key, required this.title, required this.type});

  final String title;
  final MovieListType type;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<MoviesCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener<MoviesAction>(cubit, (action) {
      if (action is MoviesNavigateToDetails) {
        // final movieId = action.movieId;
        // context.go('/detail/$movieId');
      }
    });

    useEffect(() {
      cubit.getMovieList(type);
      return null;
    }, []);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.h2),
          AppSpacings.medium(),
          SizedBox(
            height: 300,
            child: switch (state) {
              MoviesLoading() => const Center(child: CircularProgressIndicator()),
              MoviesError(:final message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message),
                    AppSpacings.medium(),
                    TextButton(
                      onPressed: () => cubit.getMovieList(type),
                      child: const Text('Try again.'),
                    ),
                  ],
                ),
              ),
              MoviesLoaded(:final movies) => ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => cubit.navigateToDetails(movies[index].id ?? 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        AppAssets.movieImageBasePath + movies[index].posterPath!,
                        width: 180,
                        height: 270,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                separatorBuilder:
                    (context, index) => SizedBox(width: AppDimens.m),
                itemCount: movies.length,
              ),
              _ => const Center(child: CircularProgressIndicator()),
            },
          ),
        ],
      ),
    );
  }
}
