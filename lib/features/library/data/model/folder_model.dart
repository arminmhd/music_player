import '../../domain/entities/folder_entity.dart';

class FolderModel {
  final int id;
  final String name;
  final int songCount;

  const FolderModel({
    required this.id,
    required this.name,
    required this.songCount,
  });

  factory FolderModel.fromMap(Map<String, dynamic> map) {
    return FolderModel(
      id: map["id"],
      name: map["name"],
      songCount: map["songCount"],
    );
  }

  FolderEntity toEntity() {
    return FolderEntity(id: id, name: name, songCount: songCount);
  }
}
