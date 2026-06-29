import 'package:flutter/material.dart';
import 'package:my_player/features/library/domain/entities/folder_entity.dart';
import 'package:my_player/features/library/presentation/widgets/folder/folder_tile.dart';

class FolderList extends StatelessWidget {
  const FolderList({super.key, required this.folders});

  final List<FolderEntity> folders;

  @override
  Widget build(BuildContext context) {
    if (folders.isEmpty) {
      return const Center(child: Text('No folders found'));
    }

    return ListView.builder(
      itemCount: folders.length,
      itemBuilder: (_, index) {
        return FolderTile(folder: folders[index]);
      },
    );
  }
}
