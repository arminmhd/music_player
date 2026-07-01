import 'package:my_player/core/platform/notification/player_notification_channel.dart';

class PlayerNotificationFacade {
  final PlayerNotificationChannel _channel;

  PlayerNotificationFacade(this._channel);

  Future<void> show({
    required String title,
    required String artist,
    required bool isPlaying,
  }) async {
    await _channel.show(title: title, artist: artist, isPlaying: isPlaying);
  }

  Future<void> play({required String title, required String artist}) async {
    await _channel.play(title: title, artist: artist);
  }

  Future<void> pause({required String title, required String artist}) async {
    await _channel.pause(title: title, artist: artist);
  }

  Future<void> next() async {
    await _channel.next();
  }

  Future<void> previous() async {
    await _channel.previous();
  }

  Future<void> stop() async {
    await _channel.stop();
  }
}
