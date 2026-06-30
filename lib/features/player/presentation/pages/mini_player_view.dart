import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_player/core/extension/context/theme_extension.dart';
import 'package:my_player/features/player/presentation/bloc/player_bloc.dart';
import 'package:my_player/features/player/presentation/bloc/player_event.dart';
import 'package:my_player/features/player/presentation/bloc/player_state.dart';
import 'package:my_player/features/player/presentation/widgets/mini_player/min_player_controls.dart';
import 'package:my_player/features/player/presentation/widgets/mini_player/mini_player_artwork.dart';
import 'package:my_player/features/player/presentation/widgets/mini_player/mini_player_info.dart';

class MiniPlayerView extends StatelessWidget {
  const MiniPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final song = state.currentSong;

        if (song == null) {
          return const SizedBox.shrink();
        }

        return Material(
          color: context.colors.surfaceContainerHighest,
          child: InkWell(
            child: SizedBox(
              height: 64.h,
              child: Row(
                children: [
                  MiniPlayerArtwork(song: song),

                  MiniPlayerInfo(song: song),

                  MiniPlayerControls(
                    isPlaying: state.isPlaying,
                    onPreviousPressed: () => context.read<PlayerBloc>().add(
                      const PreviousSongEvent(),
                    ),
                    onPlayPressed: () {
                      if (state.isPlaying) {
                        context.read<PlayerBloc>().add(PausePlayerEvent());
                      } else {
                        context.read<PlayerBloc>().add(PlayPlayerEvent());
                      }
                    },
                    onNextPressed: () =>
                        context.read<PlayerBloc>().add(const NextSongEvent()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
