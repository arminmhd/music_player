import 'package:my_player/features/player/domain/repository/player_repository.dart';

class PlaySongUseCase {
  final PlayerRepository _repository;

  const PlaySongUseCase(this._repository);

  Future<void> call() {
    return _repository.play();
  }
}
