import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_player/features/player/presentation/bloc/player_event.dart';
import 'package:my_player/features/player/presentation/bloc/player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerState.initial()) {
    on<InitializePlayerEvent>(_onInitialize);

    on<PlayPlayerEvent>(_onPlay);

    on<PausePlayerEvent>(_onPause);

    on<SeekPlayerEvent>(_onSeek);

    on<NextSongEvent>(_onNext);

    on<PreviousSongEvent>(_onPrevious);

    on<ToggleShuffleEvent>(_onShuffle);

    on<ToggleRepeatEvent>(_onRepeat);
  }

  Future<void> _onInitialize(
    InitializePlayerEvent event,
    Emitter<PlayerState> emit,
  ) async {
    emit(
      state.copyWith(
        currentSong: event.song,
        duration: Duration(milliseconds: event.song.duration),
      ),
    );
  }

  Future<void> _onPlay(PlayPlayerEvent event, Emitter<PlayerState> emit) async {
    emit(state.copyWith(isPlaying: true));
  }

  Future<void> _onPause(
    PausePlayerEvent event,
    Emitter<PlayerState> emit,
  ) async {
    emit(state.copyWith(isPlaying: false));
  }

  Future<void> _onSeek(SeekPlayerEvent event, Emitter<PlayerState> emit) async {
    emit(state.copyWith(position: event.position));
  }

  Future<void> _onNext(NextSongEvent event, Emitter<PlayerState> emit) async {}

  Future<void> _onPrevious(
    PreviousSongEvent event,
    Emitter<PlayerState> emit,
  ) async {}

  Future<void> _onShuffle(
    ToggleShuffleEvent event,
    Emitter<PlayerState> emit,
  ) async {
    emit(state.copyWith(isShuffleEnabled: !state.isShuffleEnabled));
  }

  Future<void> _onRepeat(
    ToggleRepeatEvent event,
    Emitter<PlayerState> emit,
  ) async {
    emit(state.copyWith(isRepeatEnabled: !state.isRepeatEnabled));
  }
}
