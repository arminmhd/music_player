import 'package:equatable/equatable.dart';

class FolderEntity extends Equatable {
  final int id;
  final String name;
  final int songCount;

  const FolderEntity({
    required this.id,
    required this.name,
    required this.songCount,
  });

  @override
  List<Object?> get props => [id, name, songCount];
}
