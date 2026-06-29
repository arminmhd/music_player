package com.example.my_player.platform.media_store.readers

import android.content.ContentResolver
import android.provider.MediaStore

class ArtistReader(
    private val contentResolver: ContentResolver,
) {

    fun getArtists(): List<Map<String, Any?>> {
        val artists = mutableListOf<Map<String, Any?>>()

        val projection = arrayOf(
            MediaStore.Audio.Artists._ID,
            MediaStore.Audio.Artists.ARTIST,
            MediaStore.Audio.Artists.NUMBER_OF_TRACKS,
            MediaStore.Audio.Artists.NUMBER_OF_ALBUMS,
        )

        val sortOrder =
            "${MediaStore.Audio.Artists.ARTIST} ASC"

        contentResolver.query(
            MediaStore.Audio.Artists.EXTERNAL_CONTENT_URI,
            projection,
            null,
            null,
            sortOrder,
        )?.use { cursor ->

            val idIndex =
                cursor.getColumnIndexOrThrow(MediaStore.Audio.Artists._ID)

            val artistIndex =
                cursor.getColumnIndexOrThrow(MediaStore.Audio.Artists.ARTIST)

            val tracksIndex =
                cursor.getColumnIndexOrThrow(
                    MediaStore.Audio.Artists.NUMBER_OF_TRACKS,
                )

            val albumsIndex =
                cursor.getColumnIndexOrThrow(
                    MediaStore.Audio.Artists.NUMBER_OF_ALBUMS,
                )

            while (cursor.moveToNext()) {

                artists.add(
                    mapOf(
                        "id" to cursor.getLong(idIndex),
                        "name" to (cursor.getString(artistIndex) ?: "Unknown Artist"),
                        "trackCount" to cursor.getInt(tracksIndex),
                        "albumCount" to cursor.getInt(albumsIndex),
                    ),
                )
            }
        }

        return artists
    }
}