import 'package:my_player/features/player/domain/repository/player_repository.dart';

class SeekSongUseCase {
  final PlayerRepository _repository;

  const SeekSongUseCase(this._repository);

  Future<void> call(Duration position) {
    return _repository.seek(position);
  }
}
