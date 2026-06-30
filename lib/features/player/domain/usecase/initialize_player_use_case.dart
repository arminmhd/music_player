import 'package:my_player/features/player/domain/repository/player_repository.dart';

class InitializePlayerUseCase {
  final PlayerRepository repository;
  InitializePlayerUseCase(this.repository);

  Future<void> call() {
    return repository.initialize();
  }
}
