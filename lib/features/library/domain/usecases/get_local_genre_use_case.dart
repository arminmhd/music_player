import 'package:my_player/features/library/domain/entities/genre_entity.dart';
import 'package:my_player/features/library/domain/library_repository.dart';

class GetLocalGenreUseCase {
  final LibraryRepository repository;

  const GetLocalGenreUseCase(this.repository);

  Future<List<GenreEntity>> call() {
    return repository.getGenres();
  }
}
