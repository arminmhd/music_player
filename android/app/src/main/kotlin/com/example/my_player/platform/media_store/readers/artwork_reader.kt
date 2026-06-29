package com.example.my_player.platform.media_store.readers

import android.content.ContentResolver
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri

class ArtworkReader(
    private val contentResolver: ContentResolver,
) {

    fun getArtwork(albumId: Long): ByteArray? {
        return try {

            val uri = Uri.parse(
                "content://media/external/audio/albumart/$albumId"
            )

            contentResolver.openFileDescriptor(uri, "r")?.use { descriptor ->
                val bitmap = BitmapFactory.decodeFileDescriptor(descriptor.fileDescriptor)

                bitmapToBytes(bitmap)
            }

        } catch (e: Exception) {
            null
        }
    }

    private fun bitmapToBytes(bitmap: Bitmap): ByteArray {
        val stream = java.io.ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.JPEG, 90, stream)
        return stream.toByteArray()
    }
}