import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_player/core/service/notification/player_notification_facade.dart';
import 'package:my_player/features/player/domain/repository/player_repository.dart';
import 'package:my_player/features/player/domain/usecase/initialize_player_use_case.dart';
import 'package:my_player/features/player/domain/usecase/load_song_use_case.dart';
import 'package:my_player/features/player/domain/usecase/pause_song_use_case.dart';
import 'package:my_player/features/player/domain/usecase/play_song_use_case.dart';
import 'package:my_player/features/player/domain/usecase/seek_song_use_case.dart';
import 'package:my_player/features/player/domain/usecase/toggle_shuffle_use_case.dart';
import 'player_event.dart';
import 'player_state.dart';
import '../enum/repeate_enum.dart';
import 'package:just_audio/just_audio.dart' as just_audio;

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final InitializePlayerUseCase _initializePlayer;
  final PlayerNotificationFacade _notification;
  final LoadSongUseCase _loadSong;
  final PlaySongUseCase _playSong;
  final PauseSongUseCase _pauseSong;
  final SeekSongUseCase _seekSong;
  final ToggleShuffleUseCase _toggleShuffle;
  final PlayerRepository _repository;

  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration?>? _durationSubscription;
  StreamSubscription<dynamic>? _playbackSubscription;
  StreamSubscription<just_audio.ProcessingState>? _processingSubscription;
  PlayerBloc({
    required this._initializePlayer,
    required this._notification,
    required this._loadSong,
    required this._playSong,
    required this._pauseSong,
    required this._seekSong,
    required this._repository,
    required this._toggleShuffle,
  }) : super(PlayerState.initial()) {
    _listenStreams();

    on<InitializePlayerEvent>(_onInitialize);
    on<PlayPlayerEvent>(_onPlay);
    on<PausePlayerEvent>(_onPause);
    on<SeekPlayerEvent>(_onSeek);
    on<PositionChangedEvent>(_onPositionChanged);
    on<DurationChangedEvent>(_onDurationChanged);
    on<PlaybackStateChangedEvent>(_onPlaybackStateChanged);
    on<NextSongEvent>(_onNextSong);
    on<PreviousSongEvent>(_onPreviousSong);
    on<ToggleShuffleEvent>(_onToggleShuffle);
    on<ToggleRepeatEvent>(_onToggleRepeat);
    on<SongCompletedEvent>(_onSongCompleted);
  }

  String get _title => state.queue.isNotEmpty
      ? state.queue[state.currentIndex].title
      : 'Unknown';

  String get _artist => state.queue.isNotEmpty
      ? state.queue[state.currentIndex].artist
      : 'Unknown';

  Future<void> _onInitialize(
    InitializePlayerEvent event,
    Emitter<PlayerState> emit,
  ) async {
    final song = event.queue[event.initialIndex];

    final newState = state.copyWith(
      queue: event.queue,
      currentIndex: event.initialIndex,
      duration: Duration(milliseconds: song.duration),
      position: Duration.zero,
    );
    emit(newState);

    await _initializePlayer();
    await _loadSong(song);

    await _notification.show(
      title: song.title,
      artist: song.artist,
      isPlaying: true,
    );

    await _playSong();
  }

  Future<void> _playSongAtIndex(int index, Emitter<PlayerState> emit) async {
    final song = state.queue[index];

    await _loadSong(song);
    await _playSong();

    emit(
      state.copyWith(
        currentIndex: index,
        position: Duration.zero,
        duration: Duration(milliseconds: song.duration),
      ),
    );
    await _notification.play(title: song.title, artist: song.artist);
  }

  Future<void> _onPlay(PlayPlayerEvent event, Emitter<PlayerState> emit) async {
    await _playSong();
    await _notification.play(title: _title, artist: _artist);
  }

  Future<void> _onPause(
    PausePlayerEvent event,
    Emitter<PlayerState> emit,
  ) async {
    await _pauseSong();
    await _notification.pause(title: _title, artist: _artist);
  }

  Future<void> _onSeek(SeekPlayerEvent event, Emitter<PlayerState> emit) async {
    await _seekSong(event.position);

    emit(state.copyWith(position: event.position));
  }

  void _onPositionChanged(
    PositionChangedEvent event,
    Emitter<PlayerState> emit,
  ) {
    if (state.isSeeking) return;

    emit(state.copyWith(position: event.position));
  }

  void _onDurationChanged(
    DurationChangedEvent event,
    Emitter<PlayerState> emit,
  ) {
    emit(state.copyWith(duration: event.duration));
  }

  void _onPlaybackStateChanged(
    PlaybackStateChangedEvent event,
    Emitter<PlayerState> emit,
  ) {
    emit(state.copyWith(isPlaying: event.isPlaying));
  }

  Future<void> _onNextSong(
    NextSongEvent event,
    Emitter<PlayerState> emit,
  ) async {
    if (state.queue.isEmpty) return;

    int nextIndex;

    if (state.isShuffleEnabled) {
      final random = Random();

      do {
        nextIndex = random.nextInt(state.queue.length);
      } while (state.queue.length > 1 && nextIndex == state.currentIndex);
    } else {
      if (state.currentIndex >= state.queue.length - 1) return;

      nextIndex = state.currentIndex + 1;
    }

    await _playSongAtIndex(nextIndex, emit);
  }

  Future<void> _onPreviousSong(
    PreviousSongEvent event,
    Emitter<PlayerState> emit,
  ) async {
    if (state.queue.isEmpty) return;

    int previousIndex;

    if (state.isShuffleEnabled) {
      final random = Random();

      do {
        previousIndex = random.nextInt(state.queue.length);
      } while (state.queue.length > 1 && previousIndex == state.currentIndex);
    } else {
      if (state.currentIndex <= 0) return;

      previousIndex = state.currentIndex - 1;
    }

    await _playSongAtIndex(previousIndex, emit);
  }

  void _listenStreams() {
    _positionSubscription = _repository.positionStream.listen((position) {
      add(PositionChangedEvent(position));
    });

    _durationSubscription = _repository.durationStream.listen((duration) {
      add(DurationChangedEvent(duration ?? Duration.zero));
    });

    _playbackSubscription = _repository.playbackStateStream.listen((
      playerState,
    ) {
      add(PlaybackStateChangedEvent(playerState.playing));
    });

    _processingSubscription = _repository.processingStateStream.listen((state) {
      if (state == just_audio.ProcessingState.completed) {
        add(const SongCompletedEvent());
      }
    });
  }

  Future<void> _onToggleShuffle(
    ToggleShuffleEvent event,
    Emitter<PlayerState> emit,
  ) async {
    final enabled = !state.isShuffleEnabled;

    await _toggleShuffle(enabled);

    emit(state.copyWith(isShuffleEnabled: enabled));
  }

  void _onToggleRepeat(ToggleRepeatEvent event, Emitter<PlayerState> emit) {
    final nextMode = switch (state.repeatMode) {
      RepeatMode.off => RepeatMode.all,
      RepeatMode.all => RepeatMode.one,
      RepeatMode.one => RepeatMode.off,
    };

    emit(state.copyWith(repeatMode: nextMode));
  }

  Future<void> _onSongCompleted(
    SongCompletedEvent event,
    Emitter<PlayerState> emit,
  ) async {
    if (state.queue.isEmpty) return;

    switch (state.repeatMode) {
      case RepeatMode.one:
        await _playSongAtIndex(state.currentIndex, emit);
      case RepeatMode.all:
        final nextIndex = state.currentIndex == state.queue.length - 1
            ? 0
            : state.currentIndex + 1;
        await _playSongAtIndex(nextIndex, emit);
      case RepeatMode.off:
        if (state.currentIndex < state.queue.length - 1) {
          await _playSongAtIndex(state.currentIndex + 1, emit);
        }
        break;
    }
  }

  @override
  Future<void> close() {
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    _playbackSubscription?.cancel();
    _processingSubscription?.cancel();

    return super.close();
  }
}
