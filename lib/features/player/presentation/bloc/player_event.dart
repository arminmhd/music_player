import 'package:equatable/equatable.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object?> get props => [];
}

/// ----------------------------
/// UI Events
/// ----------------------------

class InitializePlayerEvent extends PlayerEvent {
  final List<SongEntity> queue;
  final int initialIndex;

  const InitializePlayerEvent({
    required this.queue,
    required this.initialIndex,
  });

  @override
  List<Object?> get props => [queue, initialIndex];
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

class StopPlayerEvent extends PlayerEvent {
  const StopPlayerEvent();
}

/// ----------------------------
/// Internal Events
/// ----------------------------

class PositionChangedEvent extends PlayerEvent {
  final Duration position;

  const PositionChangedEvent(this.position);

  @override
  List<Object?> get props => [position];
}

class DurationChangedEvent extends PlayerEvent {
  final Duration duration;

  const DurationChangedEvent(this.duration);

  @override
  List<Object?> get props => [duration];
}

class PlaybackStateChangedEvent extends PlayerEvent {
  final bool isPlaying;

  const PlaybackStateChangedEvent(this.isPlaying);

  @override
  List<Object?> get props => [isPlaying];
}
