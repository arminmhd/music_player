import 'package:flutter/services.dart';
import 'package:my_player/app/di/injection_container.dart';
import 'package:my_player/core/platform/notification/player_notification_channel.dart';
import 'package:my_player/features/player/presentation/bloc/player_bloc.dart';
import 'package:my_player/features/player/presentation/bloc/player_event.dart';

class PlayerNotificationService {
  final PlayerNotificationChannel _channel;

  PlayerNotificationService(this._channel);

  void initialize() {
    _channel.setHandler(_handle);
  }

  Future<void> _handle(MethodCall call) async {
    final bloc = sl<PlayerBloc>();

    switch (call.method) {
      case 'play':
        bloc.add(PlayPlayerEvent());
        break;

      case 'pause':
        bloc.add(PausePlayerEvent());
        break;

      case 'next':
        bloc.add(const NextSongEvent());
        break;

      case 'previous':
        bloc.add(const PreviousSongEvent());
        break;
    }
  }
}
