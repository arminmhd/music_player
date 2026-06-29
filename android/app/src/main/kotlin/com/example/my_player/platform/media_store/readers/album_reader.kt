package com.example.my_player.platform.media_store.readers

import android.content.ContentResolver
import android.provider.MediaStore

class AlbumReader(
    private val contentResolver: ContentResolver,
) {

    fun getAlbums(): List<Map<String, Any?>> {
        val albums = mutableListOf<Map<String, Any?>>()

        val projection = arrayOf(
            MediaStore.Audio.Albums._ID,
            MediaStore.Audio.Albums.ALBUM,
            MediaStore.Audio.Albums.ARTIST,
            MediaStore.Audio.Albums.NUMBER_OF_SONGS,
        )

        val sortOrder =
            "${MediaStore.Audio.Albums.ALBUM} ASC"

        contentResolver.query(
            MediaStore.Audio.Albums.EXTERNAL_CONTENT_URI,
            projection,
            null,
            null,
            sortOrder,
        )?.use { cursor ->

            val idIndex =
                cursor.getColumnIndexOrThrow(MediaStore.Audio.Albums._ID)

            val albumIndex =
                cursor.getColumnIndexOrThrow(MediaStore.Audio.Albums.ALBUM)

            val artistIndex =
                cursor.getColumnIndexOrThrow(MediaStore.Audio.Albums.ARTIST)

            val songCountIndex =
                cursor.getColumnIndexOrThrow(
                    MediaStore.Audio.Albums.NUMBER_OF_SONGS,
                )

            while (cursor.moveToNext()) {

                albums.add(
                    mapOf(
                        "id" to cursor.getLong(idIndex),
                        "name" to (cursor.getString(albumIndex) ?: "Unknown Album"),
                        "artist" to (cursor.getString(artistIndex) ?: "Unknown Artist"),
                        "songCount" to cursor.getInt(songCountIndex),
                    ),
                )
            }
        }

        return albums
    }
}