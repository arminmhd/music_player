package com.example.my_player.platform.media_store.readers

import android.content.ContentResolver
import android.provider.MediaStore

class FolderReader(
    private val contentResolver: ContentResolver,
) {

    fun getFolders(): List<Map<String, Any?>> {

        val folders = linkedMapOf<String, Int>()

        val projection = arrayOf(
            MediaStore.Audio.Media.RELATIVE_PATH,
        )

        val selection =
            "${MediaStore.Audio.Media.IS_MUSIC} != 0"

        contentResolver.query(
            MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
            projection,
            selection,
            null,
            "${MediaStore.Audio.Media.RELATIVE_PATH} ASC",
        )?.use { cursor ->

            val pathIndex =
                cursor.getColumnIndexOrThrow(
                    MediaStore.Audio.Media.RELATIVE_PATH,
                )

            while (cursor.moveToNext()) {

                val path = cursor.getString(pathIndex)?.trim()

                if (path.isNullOrEmpty()) continue

                folders[path] = (folders[path] ?: 0) + 1
            }
        }

        val result = mutableListOf<Map<String, Any?>>()

        var id = 0L

        folders.forEach { (path, count) ->
            result.add(
                mapOf(
                    "id" to id++,
                    "name" to path.removeSuffix("/"),
                    "songCount" to count,
                ),
            )
        }

        return result
    }
}