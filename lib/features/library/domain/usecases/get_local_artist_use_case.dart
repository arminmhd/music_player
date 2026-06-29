import 'package:my_player/features/library/domain/entities/artist_entity.dart';
import 'package:my_player/features/library/domain/library_repository.dart';

class GetLocalArtistUseCase {
  final LibraryRepository repository;

  const GetLocalArtistUseCase(this.repository);

  Future<List<ArtistEntity>> call() {
    return repository.getArtists();
  }
}
