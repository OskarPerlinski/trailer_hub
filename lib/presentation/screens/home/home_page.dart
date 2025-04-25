import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trailer_hub/domain/movie/models/movie_list.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';
import 'package:trailer_hub/presentation/widget/movie_card/movie_list.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.xl),
        child: Column(
          children: [MovieList(title: 'Popular', type: MovieListType.popular)],
        ),
      ),
    );
  }
}
