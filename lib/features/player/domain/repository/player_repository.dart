import 'package:just_audio/just_audio.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';

abstract interface class PlayerRepository {
  Stream<Duration> get positionStream;

  Stream<Duration?> get durationStream;

  Stream<PlayerState> get playbackStateStream;

  Future<void> initialize();

  Future<void> loadSong(SongEntity song);

  Future<void> setShuffleMode(bool enabled);
  Future<bool> getShuffleMode();

  Future<void> play();

  Future<void> pause();

  Future<void> seek(Duration position);

  Future<void> stop();

  Future<void> dispose();

  Stream<ProcessingState> get processingStateStream;
}
