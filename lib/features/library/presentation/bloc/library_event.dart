import 'package:equatable/equatable.dart';

import '../../domain/enum/library_tab.dart';

sealed class LibraryEvent extends Equatable {
  const LibraryEvent();

  @override
  List<Object?> get props => [];
}

final class LoadLibraryEvent extends LibraryEvent {
  const LoadLibraryEvent();
}

final class ChangeLibraryTabEvent extends LibraryEvent {
  final LibraryTab tab;

  const ChangeLibraryTabEvent(this.tab);

  @override
  List<Object?> get props => [tab];
}

/// Loaders

final class LoadSongsEvent extends LibraryEvent {
  const LoadSongsEvent();
}

final class LoadAlbumsEvent extends LibraryEvent {
  const LoadAlbumsEvent();
}

final class LoadArtistsEvent extends LibraryEvent {
  const LoadArtistsEvent();
}

final class LoadFoldersEvent extends LibraryEvent {
  const LoadFoldersEvent();
}

final class LoadGenresEvent extends LibraryEvent {
  const LoadGenresEvent();
}
