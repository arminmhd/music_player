import '../../domain/entities/genre_entity.dart';

class GenreModel {
  final int id;
  final String name;

  const GenreModel({required this.id, required this.name});

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(id: map["id"], name: map["name"]);
  }

  GenreEntity toEntity() {
    return GenreEntity(id: id, name: name);
  }
}
