package com.example.my_player.platform.media_store

import com.example.my_player.platform.media_store.readers.AlbumReader
import com.example.my_player.platform.media_store.readers.ArtistReader
import com.example.my_player.platform.media_store.readers.FolderReader
import com.example.my_player.platform.media_store.readers.GenreReader
import com.example.my_player.platform.media_store.readers.SongReader
import com.example.my_player.platform.media_store.readers.ArtworkReader
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MediaStoreHandler(
    private val songReader: SongReader,
    private val albumReader: AlbumReader,
    private val artistReader: ArtistReader,
    private val folderReader: FolderReader,
    private val genreReader: GenreReader,
    private val artworkReader: ArtworkReader,
) : MethodChannel.MethodCallHandler {

    override fun onMethodCall(
        call: MethodCall,
        result: MethodChannel.Result,
    ) {
        when (call.method) {

            "getSongs" -> {
                result.success(songReader.getSongs())
            }

            "getAlbums" -> {
                result.success(albumReader.getAlbums())
            }

            "getArtists" -> {
                result.success(artistReader.getArtists())
            }

            "getFolders" -> {
                result.success(folderReader.getFolders())
            }

            "getGenres" -> {
                result.success(genreReader.getGenres())
            }

            "getArtwork" -> {
                val albumId = call.argument<Long>("albumId") ?: 0L
                result.success(artworkReader.getArtwork(albumId))
}

            else -> result.notImplemented()
        }
    }
}