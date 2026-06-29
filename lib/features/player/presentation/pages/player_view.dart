import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_player/core/widgets/layout/app_scaffold_widget.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';
import 'package:my_player/features/player/presentation/bloc/player_bloc.dart';
import 'package:my_player/features/player/presentation/bloc/player_state.dart';
import 'package:my_player/features/player/presentation/widgets/player_app_bar.dart';
import 'package:my_player/features/player/presentation/widgets/player_artwork.dart';
import 'package:my_player/features/player/presentation/widgets/player_controls.dart';
import 'package:my_player/features/player/presentation/widgets/player_info.dart';
import 'package:my_player/features/player/presentation/widgets/player_slider.dart';

class PlayerView extends StatelessWidget {
  final SongEntity song;
  const PlayerView({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return AppScaffoldWidget(
          safeArea: true,
          body: Column(
            children: [
              PlayerAppBar(),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlayerArtwork(song: song),

                    PlayerInfo(song: song),

                    // PlayerSlider(
                    //   value: 0,
                    //   max: song.duration.toDouble(),
                    //   position: '00:00',
                    //   duration: _formatDuration(song.duration),
                    //   onChanged: (_) {},
                    // ),
                    PlayerControls(),
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
