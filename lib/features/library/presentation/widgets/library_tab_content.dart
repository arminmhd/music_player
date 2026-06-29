import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_player/app/router/route_names.dart';
import 'package:my_player/features/library/domain/enum/library_tab.dart';
import 'package:my_player/features/library/presentation/bloc/library_bloc.dart';
import 'package:my_player/features/library/presentation/bloc/library_state.dart';
import 'package:my_player/features/library/presentation/widgets/album/album_list.dart';
import 'package:my_player/features/library/presentation/widgets/artist/artist_list.dart';
import 'package:my_player/features/library/presentation/widgets/folder/folder_list.dart';
import 'package:my_player/features/library/presentation/widgets/genre/genre_list.dart';
import 'package:my_player/features/library/presentation/widgets/song/library_song_list.dart';

class LibraryTabContent extends StatelessWidget {
  const LibraryTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      buildWhen: (previous, current) =>
          previous.selectedTab != current.selectedTab ||
          previous.songs != current.songs ||
          previous.albums != current.albums ||
          previous.artists != current.artists ||
          previous.folders != current.folders ||
          previous.genres != current.genres,
      builder: (context, state) {
        switch (state.selectedTab) {
          case LibraryTab.songs:
            return LibrarySongList(
              songs: state.songs,
              onSongTap: (song) {
                context.push(RouteNames.player, extra: song);
              },
            );

          case LibraryTab.albums:
            return AlbumList(albums: state.albums);

          case LibraryTab.artists:
            return ArtistList(artists: state.artists);

          case LibraryTab.folders:
            return FolderList(folders: state.folders);

          case LibraryTab.genres:
            return GenreList(genres: state.genres);
        }
      },
    );
  }
}
