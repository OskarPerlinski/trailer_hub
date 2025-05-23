// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trailer_hub/domain/movie/models/movie_model.dart';
import 'package:trailer_hub/presentation/theme/app_colors.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';
import 'package:trailer_hub/presentation/theme/app_spacings.dart';
import 'package:trailer_hub/presentation/theme/app_typography.dart';

class MovieInformations extends StatelessWidget {
  const MovieInformations({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movieModel.title, style: AppTypography.h1),
          AppSpacings.large(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_month, color: AppColors.secondary),
                  SizedBox(width: 5),
                  Text(
                    movieModel.releaseDate.toString().split(' ')[0],
                    style: TextStyle(color: AppColors.secondary),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.primary),
                  SizedBox(width: 5),
                  Text(movieModel.voteAverage.toString(), style: TextStyle(color: AppColors.secondary)),
                ],
              ),
            ],
          ),
          AppSpacings.large(),
          Text('Overview', style: AppTypography.h1),
          AppSpacings.large(),
          Text(
            movieModel.overview,
          ),
        ],
      ),
    );
  }
}
