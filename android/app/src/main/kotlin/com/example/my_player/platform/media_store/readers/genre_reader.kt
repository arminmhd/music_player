package com.example.my_player.platform.media_store.readers

import android.content.ContentResolver
import android.provider.MediaStore

class GenreReader(
    private val contentResolver: ContentResolver,
) {

    fun getGenres(): List<Map<String, Any?>> {

        val genres = mutableListOf<Map<String, Any?>>()

        val projection = arrayOf(
            MediaStore.Audio.Genres._ID,
            MediaStore.Audio.Genres.NAME,
        )

        contentResolver.query(
            MediaStore.Audio.Genres.EXTERNAL_CONTENT_URI,
            projection,
            null,
            null,
            "${MediaStore.Audio.Genres.NAME} ASC",
        )?.use { cursor ->

            val idIndex =
                cursor.getColumnIndexOrThrow(
                    MediaStore.Audio.Genres._ID,
                )

            val nameIndex =
                cursor.getColumnIndexOrThrow(
                    MediaStore.Audio.Genres.NAME,
                )

            while (cursor.moveToNext()) {

                genres.add(
                    mapOf(
                        "id" to cursor.getLong(idIndex),
                        "name" to (cursor.getString(nameIndex) ?: "Unknown"),
                    ),
                )
            }
        }

        return genres
    }
}