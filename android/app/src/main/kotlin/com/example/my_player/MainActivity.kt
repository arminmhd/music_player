package com.example.my_player

import com.example.my_player.platform.media_store.MediaStoreHandler
import com.example.my_player.platform.media_store.readers.AlbumReader
import com.example.my_player.platform.media_store.readers.ArtistReader
import com.example.my_player.platform.media_store.readers.FolderReader
import com.example.my_player.platform.media_store.readers.GenreReader
import com.example.my_player.platform.media_store.readers.SongReader
import com.example.my_player.platform.media_store.readers.ArtworkReader

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    companion object {
        private const val CHANNEL =
            "com.example.my_player/media_store"
    }

    override fun configureFlutterEngine(
        flutterEngine: FlutterEngine,
    ) {

        super.configureFlutterEngine(flutterEngine)

        val resolver = applicationContext.contentResolver

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL,
        ).setMethodCallHandler(
            MediaStoreHandler(
                songReader = SongReader(resolver),
                albumReader = AlbumReader(resolver),
                artistReader = ArtistReader(resolver),
                folderReader = FolderReader(resolver),
                genreReader = GenreReader(resolver),
                artworkReader = ArtworkReader(resolver),
            ),
        )
    }
}