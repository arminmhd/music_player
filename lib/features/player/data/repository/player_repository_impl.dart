import 'package:just_audio/just_audio.dart';
import 'package:my_player/core/service/audioplayer/player_service.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';
import 'package:my_player/features/player/domain/repository/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final PlayerService _audioPlayerService;

  const PlayerRepositoryImpl(this._audioPlayerService);

  @override
  Stream<Duration> get positionStream => _audioPlayerService.positionStream;

  @override
  Stream<Duration?> get durationStream => _audioPlayerService.durationStream;

  @override
  Stream<PlayerState> get playbackStateStream =>
      _audioPlayerService.playbackStateStream;

  @override
  Future<void> initialize() {
    return _audioPlayerService.initialize();
  }

  @override
  Future<void> loadSong(SongEntity song) {
    return _audioPlayerService.setSong(song.uri);
  }

  @override
  Future<void> play() {
    return _audioPlayerService.play();
  }

  @override
  Future<void> pause() {
    return _audioPlayerService.pause();
  }

  @override
  Future<void> seek(Duration position) {
    return _audioPlayerService.seek(position);
  }

  @override
  Future<void> stop() {
    return _audioPlayerService.stop();
  }

  @override
  Future<void> dispose() {
    return _audioPlayerService.dispose();
  }
}
