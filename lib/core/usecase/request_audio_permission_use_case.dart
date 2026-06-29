import 'package:my_player/core/repository/permission_repository.dart';

class RequestAudioPermissionUseCase {
  final PermissionRepository repository;

  const RequestAudioPermissionUseCase(this.repository);

  Future<bool> call() {
    return repository.requestAudioPermission();
  }
}
