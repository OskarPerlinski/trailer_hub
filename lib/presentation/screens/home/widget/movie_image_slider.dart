import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:trailer_hub/domain/movie/models/movie_list.dart';
import 'package:trailer_hub/presentation/assets/app_assets.dart';
import 'package:trailer_hub/presentation/screens/home/cubit/movies_action.dart';
import 'package:trailer_hub/presentation/screens/home/cubit/movies_cubit.dart';
import 'package:trailer_hub/presentation/screens/home/cubit/movies_state.dart';
import 'package:trailer_hub/presentation/theme/app_colors.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';
import 'package:trailer_hub/presentation/theme/app_spacings.dart';
import 'package:trailer_hub/presentation/theme/app_typography.dart';

class MovieImageSlider extends HookWidget {
  const MovieImageSlider({super.key, required this.type, required this.title});

  final MovieListType type;
  final String title;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<MoviesCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener<MoviesAction>(cubit, (action) {
      if (action is MoviesNavigateToDetails) {
        final movieId = action.movieId;
        context.push('/detail/$movieId');
      }
    });

    useEffect(() {
      cubit.getMovieList(type);
      return null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.xl),
          child: Text(title, style: AppTypography.h2),
        ),
        AppSpacings.medium(),
        switch (state) {
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
          MoviesLoaded(:final movies) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FanCarouselImageSlider.sliderType1(
                imagesLink:
                    movies
                        .take(5)
                        .map(
                          (item) =>
                              AppAssets.movieImageBasePath + item.posterPath,
                        )
                        .toList(),
                isAssets: false,
                autoPlay: false,
                sliderHeight: 400,
                showIndicator: true,
                indicatorActiveColor: AppColors.primary,
                indicatorDeactiveColor: AppColors.black,
              ),
            ],
          ),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ],
    );
  }
}
