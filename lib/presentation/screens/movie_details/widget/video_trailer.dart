import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:trailer_hub/presentation/screens/movie_details/cubit/video/video_cubit.dart';
import 'package:trailer_hub/presentation/screens/movie_details/cubit/video/video_state.dart';
import 'package:trailer_hub/presentation/theme/app_spacings.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoTrailer extends HookWidget {
  const VideoTrailer({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<VideoCubit>();
    final state = useBlocBuilder(cubit);

    final controller = useState<YoutubePlayerController?>(null);

    useEffect(() {
      cubit.getMovieTrailer(movieId);
      return null;
    }, []);

    if (state is VideoLoaded && controller.value == null) {
      final videoId = state.videoId;
      controller.value = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
    }

    return SizedBox(
      height: 230,
      child: switch (state) {
        VideoLoading() => const Center(child: CircularProgressIndicator()),
        VideoLoaded() =>
          controller.value != null
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: YoutubePlayer(
                  controller: controller.value!,
                  showVideoProgressIndicator: true,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.red,
                    handleColor: Colors.redAccent,
                  ),
                ),
              )
              : const Center(child: CircularProgressIndicator()),
        VideoError(:final message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
              AppSpacings.medium(),
              TextButton(
                onPressed: () => cubit.getMovieTrailer(movieId),
                child: const Text('Try again.'),
              ),
            ],
          ),
        ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
