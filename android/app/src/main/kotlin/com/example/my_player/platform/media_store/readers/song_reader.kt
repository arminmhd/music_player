package com.example.my_player.platform.media_store.readers

import android.content.ContentResolver
import android.provider.MediaStore

class SongReader(
    private val contentResolver: ContentResolver,
) {

    fun getSongs(): List<Map<String, Any?>> {
        val songs = mutableListOf<Map<String, Any?>>()

        val projection = arrayOf(
            MediaStore.Audio.Media._ID,
            MediaStore.Audio.Media.TITLE,
            MediaStore.Audio.Media.ARTIST,
            MediaStore.Audio.Media.ALBUM,
            MediaStore.Audio.Media.ALBUM_ID,
            MediaStore.Audio.Media.DURATION,
            MediaStore.Audio.Media.SIZE,
        )

        val selection =
            "${MediaStore.Audio.Media.IS_MUSIC} != 0"

        val sortOrder =
            "${MediaStore.Audio.Media.TITLE} ASC"

        contentResolver.query(
            MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
            projection,
            selection,
            null,
            sortOrder,
        )?.use { cursor ->

            val idIndex =
                cursor.getColumnIndexOrThrow(MediaStore.Audio.Media._ID)

            val titleIndex =
                cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.TITLE)

            val artistIndex =
                cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.ARTIST)

            val albumIndex =
                cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.ALBUM)

            val albumIdIndex =
                cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.ALBUM_ID)

            val durationIndex =
                cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.DURATION)

            val sizeIndex =
                cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.SIZE)

            while (cursor.moveToNext()) {

                val id = cursor.getLong(idIndex)

                songs.add(
                    mapOf(
                        "id" to id,
                        "title" to (cursor.getString(titleIndex) ?: "Unknown"),
                        "artist" to (cursor.getString(artistIndex) ?: "Unknown"),
                        "album" to (cursor.getString(albumIndex) ?: "Unknown"),
                        "albumId" to cursor.getLong(albumIdIndex),
                        "duration" to cursor.getLong(durationIndex),
                        "size" to cursor.getLong(sizeIndex),
                        "uri" to
                            "${MediaStore.Audio.Media.EXTERNAL_CONTENT_URI}/$id",
                    ),
                )
            }
        }

        return songs
    }
}