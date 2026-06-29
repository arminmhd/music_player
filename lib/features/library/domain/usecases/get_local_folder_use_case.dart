import 'package:my_player/features/library/domain/entities/folder_entity.dart';
import 'package:my_player/features/library/domain/library_repository.dart';

class GetLocalFolderUseCase {
  final LibraryRepository repository;

  const GetLocalFolderUseCase(this.repository);

  Future<List<FolderEntity>> call() {
    return repository.getFolders();
  }
}
