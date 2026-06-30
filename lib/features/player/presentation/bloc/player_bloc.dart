import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_player/features/player/domain/repository/player_repository.dart';
import 'package:my_player/features/player/domain/usecase/initialize_player_use_case.dart';
import 'package:my_player/features/player/domain/usecase/load_song_use_case.dart';
import 'package:my_player/features/player/domain/usecase/pause_song_use_case.dart';
import 'package:my_player/features/player/domain/usecase/play_song_use_case.dart';
import 'package:my_player/features/player/domain/usecase/seek_song_use_case.dart';
import 'player_event.dart';
import 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final InitializePlayerUseCase _initializePlayer;
  final LoadSongUseCase _loadSong;
  final PlaySongUseCase _playSong;
  final PauseSongUseCase _pauseSong;
  final SeekSongUseCase _seekSong;
  final PlayerRepository _repository;

  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration?>? _durationSubscription;
  StreamSubscription<dynamic>? _playbackSubscription;

  PlayerBloc({
    required this._initializePlayer,
    required this._loadSong,
    required this._playSong,
    required this._pauseSong,
    required this._seekSong,
    required this._repository,
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
  }

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
    await _playSong();
  }

  Future<void> _onPlay(PlayPlayerEvent event, Emitter<PlayerState> emit) async {
    await _playSong();
  }

  Future<void> _onPause(
    PausePlayerEvent event,
    Emitter<PlayerState> emit,
  ) async {
    await _pauseSong();
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

    if (state.currentIndex >= state.queue.length - 1) return;

    final nextIndex = state.currentIndex + 1;
    final nextSong = state.queue[nextIndex];

    emit(
      state.copyWith(
        currentIndex: nextIndex,
        position: Duration.zero,
        duration: Duration(milliseconds: nextSong.duration),
      ),
    );

    await _loadSong(nextSong);
    await _playSong();
  }

  Future<void> _onPreviousSong(
    PreviousSongEvent event,
    Emitter<PlayerState> emit,
  ) async {
    if (state.queue.isEmpty) return;

    if (state.currentIndex <= 0) return;

    final previousIndex = state.currentIndex - 1;
    final previousSong = state.queue[previousIndex];

    emit(
      state.copyWith(
        currentIndex: previousIndex,
        position: Duration.zero,
        duration: Duration(milliseconds: previousSong.duration),
      ),
    );

    await _loadSong(previousSong);
    await _playSong();
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
  }

  @override
  Future<void> close() {
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    _playbackSubscription?.cancel();

    return super.close();
  }
}
