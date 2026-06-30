import 'package:just_audio/just_audio.dart';

abstract interface class PlayerService {
  Stream<Duration> get positionStream;

  Stream<PlayerState> get playbackStateStream;

  Stream<Duration?> get durationStream;

  Future<void> initialize();

  Future<void> setSong(String uri);

  Future<void> play();

  Future<void> pause();

  Future<void> seek(Duration position);

  Future<void> stop();

  Future<void> dispose();
}
