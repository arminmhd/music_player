import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_player/core/extension/context/theme_extension.dart';
import 'package:my_player/core/widgets/layout/app_scaffold_widget.dart';
import 'package:my_player/features/player/presentation/bloc/player_bloc.dart';
import 'package:my_player/features/player/presentation/bloc/player_event.dart';
import 'package:my_player/features/player/presentation/bloc/player_state.dart';
import 'package:my_player/features/player/presentation/widgets/player/player_app_bar.dart';
import 'package:my_player/features/player/presentation/widgets/player/player_artwork.dart';
import 'package:my_player/features/player/presentation/widgets/player/player_controls.dart';
import 'package:my_player/features/player/presentation/widgets/player/player_info.dart';
import 'package:my_player/features/player/presentation/widgets/player/player_slider.dart';

class PlayerView extends StatefulWidget {
  const PlayerView({super.key});

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final song = state.currentSong;

        if (song == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return AppScaffoldWidget(
          background: context.colors.primary.withValues(alpha: 0.3),
          safeArea: true,
          body: Column(
            children: [
              const PlayerAppBar(),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlayerArtwork(song: song),

                    PlayerInfo(song: song),

                    PlayerSlider(
                      position: state.position,
                      duration: state.duration,
                      onChanged: (position) {
                        context.read<PlayerBloc>().add(
                          SeekPlayerEvent(position),
                        );
                      },
                    ),

                    PlayerControls(
                      isPlaying: state.isPlaying,
                      isShuffleEnabled: state.isShuffleEnabled,
                      repeatMode: state.repeatMode,

                      onPlayPressed: () {
                        if (state.isPlaying) {
                          context.read<PlayerBloc>().add(PausePlayerEvent());
                        } else {
                          context.read<PlayerBloc>().add(PlayPlayerEvent());
                        }
                      },

                      onNextPressed: () {
                        context.read<PlayerBloc>().add(const NextSongEvent());
                      },

                      onPreviousPressed: () {
                        context.read<PlayerBloc>().add(
                          const PreviousSongEvent(),
                        );
                      },

                      onShufflePressed: () {
                        context.read<PlayerBloc>().add(
                          const ToggleShuffleEvent(),
                        );
                      },

                      onRepeatPressed: () {
                        context.read<PlayerBloc>().add(
                          const ToggleRepeatEvent(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
