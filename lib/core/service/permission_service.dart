import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

abstract interface class PermissionService {
  Future<bool> requestAudioPermission();
}

class PermissionServiceImpl implements PermissionService {
  @override
  Future<bool> requestAudioPermission() async {
    if (Platform.isAndroid) {
      final permission = await Permission.audio.request();
      return permission.isGranted;
    }

    return false;
  }
}
