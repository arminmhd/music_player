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
  }

  Future<void> _onInitialize(
    InitializePlayerEvent event,
    Emitter<PlayerState> emit,
  ) async {
    await _initializePlayer();

    await _loadSong(event.song);

    emit(
      state.copyWith(
        currentSong: event.song,
        updateCurrentSong: true,
        duration: Duration(milliseconds: event.song.duration),
        position: Duration.zero,
      ),
    );
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

    _repository.dispose();

    return super.close();
  }
}
