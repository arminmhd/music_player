import 'package:my_player/features/library/domain/entities/song_entity.dart';
import 'package:my_player/features/library/domain/library_repository.dart';

class GetLocalSongUseCase {
  final LibraryRepository repository;

  GetLocalSongUseCase(this.repository);

  Future<List<SongEntity>> call() async {
    return await repository.getSongs();
  }
}
