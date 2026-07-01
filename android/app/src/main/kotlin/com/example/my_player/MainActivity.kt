package com.example.my_player

import com.example.my_player.platform.media_store.MediaStoreHandler
import com.example.my_player.platform.media_store.readers.AlbumReader
import com.example.my_player.platform.media_store.readers.ArtistReader
import com.example.my_player.platform.media_store.readers.ArtworkReader
import com.example.my_player.platform.media_store.readers.FolderReader
import com.example.my_player.platform.media_store.readers.GenreReader
import com.example.my_player.platform.media_store.readers.SongReader
import com.example.my_player.platform.notification.PlayerNotificationBridge
import com.example.my_player.platform.notification.PlayerNotificationHandler
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    companion object {
        private const val MEDIA_STORE_CHANNEL =
            "com.example.my_player/media_store"

        private const val PLAYER_NOTIFICATION_CHANNEL =
            "com.example.my_player/player_notification"
    }

    override fun configureFlutterEngine(
        flutterEngine: FlutterEngine,
    ) {
        super.configureFlutterEngine(flutterEngine)

        val resolver = applicationContext.contentResolver

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            MEDIA_STORE_CHANNEL,
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

        val notificationChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            PLAYER_NOTIFICATION_CHANNEL,
        )

        PlayerNotificationBridge.channel = notificationChannel

        notificationChannel.setMethodCallHandler(
            PlayerNotificationHandler(applicationContext),
        )
    }
}