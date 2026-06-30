import 'package:my_player/features/player/domain/repository/player_repository.dart';

class PauseSongUseCase {
  final PlayerRepository _repository;

  const PauseSongUseCase(this._repository);

  Future<void> call() {
    return _repository.pause();
  }
}
