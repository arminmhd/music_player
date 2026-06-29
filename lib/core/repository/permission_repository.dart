import 'package:my_player/core/service/permission_service.dart';

abstract interface class PermissionRepository {
  Future<bool> requestAudioPermission();
}

class PermissionRepositoryImpl implements PermissionRepository {
  final PermissionService permissionService;

  PermissionRepositoryImpl(this.permissionService);

  @override
  Future<bool> requestAudioPermission() {
    return permissionService.requestAudioPermission();
  }
}
