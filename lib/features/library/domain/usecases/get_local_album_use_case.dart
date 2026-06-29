import 'package:my_player/features/library/domain/entities/album_entity.dart';
import 'package:my_player/features/library/domain/library_repository.dart';

class GetLocalAlbumUseCase {
  final LibraryRepository repository;

  const GetLocalAlbumUseCase(this.repository);

  Future<List<AlbumEntity>> call() {
    return repository.getAlbums();
  }
}
