import 'package:my_player/features/player/domain/repository/player_repository.dart';

class ToggleShuffleUseCase {
  final PlayerRepository repository;

  const ToggleShuffleUseCase(this.repository);

  Future<void> call(bool enabled) {
    return repository.setShuffleMode(enabled);
  }
}
