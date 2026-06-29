import 'package:flutter/material.dart';

abstract final class AppIcons {
  const AppIcons._();

  // Navigation
  static const home = Icon(Icons.home_rounded);
  static const library = Icon(Icons.library_music_rounded);
  static const search = Icon(Icons.search_rounded);
  static const settings = Icon(Icons.settings_rounded);

  // Player
  static const play = Icon(Icons.play_arrow_rounded);
  static const pause = Icon(Icons.pause_rounded);
  static const next = Icon(Icons.skip_next_rounded);
  static const previous = Icon(Icons.skip_previous_rounded);
  static const shuffle = Icon(Icons.shuffle_rounded);
  static const repeat = Icons.repeat_rounded;

  // Library
  static const album = Icon(Icons.album_rounded);
  static const artist = Icons.person_rounded;
  static const folder = Icons.folder_rounded;
  static const musicNote = Icon(Icons.music_note_rounded);
  static const chevronRight = Icon(Icons.chevron_right_rounded);

  // Actions
  static const favorite = Icons.favorite_border_rounded;
  static const favoriteFilled = Icons.favorite_rounded;
  static const more = Icon(Icons.more_vert_rounded);
  static const add = Icons.add_rounded;
  static const edit = Icons.edit_rounded;
  static const delete = Icons.delete_outline_rounded;

  // Status
  static const check = Icons.check_rounded;
  static const close = Icons.close_rounded;
  static const error = Icons.error_outline_rounded;
  static const warning = Icons.warning_amber_rounded;
}
