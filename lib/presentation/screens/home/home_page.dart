import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trailer_hub/domain/movie/models/movie_list.dart';
import 'package:trailer_hub/presentation/screens/home/widget/movie_image_slider.dart';
import 'package:trailer_hub/presentation/theme/app_spacings.dart';
import 'package:trailer_hub/presentation/widget/appbar/basic_appbar.dart';
import 'package:trailer_hub/presentation/widget/movie_list/movie_list.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MovieImageSlider(title: 'Upcoming', type: MovieListType.upcoming),
              AppSpacings.xLarge(),
              MovieList(title: 'Popular', type: MovieListType.popular),
              AppSpacings.xLarge(),
              MovieList(title: 'Now Playing', type: MovieListType.nowPlaying),
              AppSpacings.xLarge(),
              MovieList(title: 'Top Rated', type: MovieListType.topRated),
            ],
          ),
        ),
      ),
    );
  }
}
