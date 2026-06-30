import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_player/core/widgets/app_artwork_widget.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';

class PlayerArtwork extends StatelessWidget {
  final SongEntity song;
  const PlayerArtwork({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppArtworkWidget(albumId: song.albumId, size: 300.w),
    );
  }
}
