import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:my_player/core/service/audioplayer/player_service.dart';

class PlayerServiceImpl implements PlayerService {
  final AudioPlayer _player = AudioPlayer();

  AudioPlayer get player => _player;

  @override
  Future<void> initialize() async {
    final session = await AudioSession.instance;

    await session.configure(const AudioSessionConfiguration.music());
  }

  @override
  Future<void> setSong(String uri) async {
    await _player.setAudioSource(AudioSource.uri(Uri.parse(uri)));
  }

  @override
  Future<void> play() async {
    await _player.play();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  @override
  Future<void> stop() async {
    await _player.stop();
  }

  @override
  Future<void> setShuffleMode(bool enabled) async {
    await _player.setShuffleModeEnabled(enabled);

    if (enabled) {
      await player.shuffle();
    }
  }

  @override
  Future<bool> getShuffleMode() async {
    return _player.shuffleModeEnabled;
  }

  @override
  Stream<Duration> get positionStream => _player.positionStream;

  @override
  Stream<Duration?> get durationStream => _player.durationStream;

  @override
  Stream<PlayerState> get playbackStateStream => _player.playerStateStream;

  @override
  Stream<ProcessingState> get processingStateStream =>
      _player.processingStateStream;

  @override
  Future<void> dispose() async {
    await _player.dispose();
  }
}
