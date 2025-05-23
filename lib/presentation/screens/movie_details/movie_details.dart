import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trailer_hub/domain/movie/models/movie_model.dart';
import 'package:trailer_hub/presentation/screens/movie_details/widget/movie_informations.dart';
import 'package:trailer_hub/presentation/screens/movie_details/widget/video_trailer.dart';
import 'package:trailer_hub/presentation/theme/app_spacings.dart';
import 'package:trailer_hub/presentation/widget/appbar/basic_appbar.dart';

class MovieDetails extends HookWidget {
  const MovieDetails({super.key, required this.id, required this.movieModel});

  final int id;
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              VideoTrailer(movieId: id),
              AppSpacings.large(),
              MovieInformations(movieModel: movieModel),
              AppSpacings.large(),
            ],
          ),
        ),
      ),
    );
  }
}
