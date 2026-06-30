import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_player/core/widgets/app_artwork_widget.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';

class MiniPlayerArtwork extends StatelessWidget {
  final SongEntity song;

  const MiniPlayerArtwork({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: AppArtworkWidget(albumId: song.albumId, size: 48.w),
    );
  }
}
