import 'package:my_player/features/library/domain/entities/song_entity.dart';
import 'package:my_player/features/player/domain/repository/player_repository.dart';

class LoadSongUseCase {
  final PlayerRepository _repository;

  const LoadSongUseCase(this._repository);

  Future<void> call(SongEntity song) {
    return _repository.loadSong(song);
  }
}
