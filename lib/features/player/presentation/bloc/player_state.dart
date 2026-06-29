import 'package:equatable/equatable.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';

class PlayerState extends Equatable {
  final SongEntity? currentSong;

  final bool isPlaying;
  final bool isLoading;

  final bool isShuffleEnabled;
  final bool isRepeatEnabled;

  final Duration position;
  final Duration duration;

  const PlayerState({
    this.currentSong,
    required this.isPlaying,
    required this.isLoading,
    required this.isShuffleEnabled,
    required this.isRepeatEnabled,
    required this.position,
    required this.duration,
  });

  factory PlayerState.initial() {
    return const PlayerState(
      currentSong: null,
      isPlaying: false,
      isLoading: false,
      isShuffleEnabled: false,
      isRepeatEnabled: false,
      position: Duration.zero,
      duration: Duration.zero,
    );
  }

  PlayerState copyWith({
    SongEntity? currentSong,
    bool? isPlaying,
    bool? isLoading,
    bool? isShuffleEnabled,
    bool? isRepeatEnabled,
    Duration? position,
    Duration? duration,
  }) {
    return PlayerState(
      currentSong: currentSong ?? this.currentSong,
      isPlaying: isPlaying ?? this.isPlaying,
      isLoading: isLoading ?? this.isLoading,
      isShuffleEnabled: isShuffleEnabled ?? this.isShuffleEnabled,
      isRepeatEnabled: isRepeatEnabled ?? this.isRepeatEnabled,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }

  @override
  List<Object?> get props => [
    currentSong,
    isPlaying,
    isLoading,
    isShuffleEnabled,
    isRepeatEnabled,
    position,
    duration,
  ];
}
