import 'package:flutter/services.dart';
import 'package:my_player/core/platform/channel_names.dart';

class PlayerNotificationChannel {
  const PlayerNotificationChannel();

  static const MethodChannel _channel = MethodChannel(
    ChannelNames.playerNotification,
  );

  void setHandler(Future<void> Function(MethodCall call) handler) {
    _channel.setMethodCallHandler(handler);
  }

  Future<void> show({
    required String title,
    required String artist,
    required bool isPlaying,
  }) async {
    await _channel.invokeMethod('show', {
      'title': title,
      'artist': artist,
      'isPlaying': isPlaying,
    });
  }

  Future<void> play({required String title, required String artist}) async {
    await _channel.invokeMethod('play', {'title': title, 'artist': artist});
  }

  Future<void> pause({required String title, required String artist}) async {
    await _channel.invokeMethod('pause', {'title': title, 'artist': artist});
  }

  Future<void> next() async {
    await _channel.invokeMethod('next');
  }

  Future<void> previous() async {
    await _channel.invokeMethod('previous');
  }

  Future<void> stop() async {
    await _channel.invokeMethod('stop');
  }
}
