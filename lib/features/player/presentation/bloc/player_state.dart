import 'package:equatable/equatable.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';
import 'package:my_player/features/player/presentation/enum/repeate_enum.dart';

class PlayerState extends Equatable {
  final List<SongEntity> queue;
  final int currentIndex;

  final bool isPlaying;
  final bool isLoading;
  final bool isSeeking;

  final bool isShuffleEnabled;
  final RepeatMode repeatMode;

  final Duration position;
  final Duration duration;

  const PlayerState({
    required this.queue,
    required this.currentIndex,
    required this.isPlaying,
    required this.isLoading,
    required this.isSeeking,
    required this.isShuffleEnabled,
    required this.repeatMode,
    required this.position,
    required this.duration,
  });

  factory PlayerState.initial() {
    return const PlayerState(
      queue: [],
      currentIndex: 0,
      isPlaying: false,
      isLoading: false,
      isSeeking: false,
      isShuffleEnabled: false,
      repeatMode: RepeatMode.off,
      position: Duration.zero,
      duration: Duration.zero,
    );
  }

  SongEntity? get currentSong {
    if (queue.isEmpty) return null;
    return queue[currentIndex];
  }

  PlayerState copyWith({
    List<SongEntity>? queue,
    int? currentIndex,
    bool? isPlaying,
    bool? isLoading,
    bool? isSeeking,
    bool? isShuffleEnabled,
    RepeatMode? repeatMode,
    Duration? position,
    Duration? duration,
  }) {
    return PlayerState(
      queue: queue ?? this.queue,
      currentIndex: currentIndex ?? this.currentIndex,
      isPlaying: isPlaying ?? this.isPlaying,
      isLoading: isLoading ?? this.isLoading,
      isSeeking: isSeeking ?? this.isSeeking,
      isShuffleEnabled: isShuffleEnabled ?? this.isShuffleEnabled,
      repeatMode: repeatMode ?? this.repeatMode,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }

  @override
  List<Object?> get props => [
    queue,
    currentIndex,
    isPlaying,
    isLoading,
    isSeeking,
    isShuffleEnabled,
    repeatMode,
    position,
    duration,
  ];
}
