import 'package:equatable/equatable.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';

class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object?> get props => [];
}

class InitializePlayerEvent extends PlayerEvent {
  final SongEntity song;
  const InitializePlayerEvent(this.song);

  @override
  List<Object?> get props => [song];
}

class PlayPlayerEvent extends PlayerEvent {
  const PlayPlayerEvent();
}

class PausePlayerEvent extends PlayerEvent {
  const PausePlayerEvent();
}

class SeekPlayerEvent extends PlayerEvent {
  final Duration position;
  const SeekPlayerEvent(this.position);

  @override
  List<Object?> get props => [position];
}

class NextSongEvent extends PlayerEvent {
  const NextSongEvent();
}

class PreviousSongEvent extends PlayerEvent {
  const PreviousSongEvent();
}

class ToggleShuffleEvent extends PlayerEvent {
  const ToggleShuffleEvent();
}

class ToggleRepeatEvent extends PlayerEvent {
  const ToggleRepeatEvent();
}
