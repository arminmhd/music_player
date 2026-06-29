import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_player/app/di/injection_container.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';
import 'package:my_player/features/player/presentation/bloc/player_bloc.dart';
import 'package:my_player/features/player/presentation/pages/player_view.dart';

class PlayerPage extends StatelessWidget {
  final SongEntity song;
  const PlayerPage({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PlayerBloc>(),
      child: PlayerView(song: song),
    );
  }
}
