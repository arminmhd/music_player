package com.example.my_player.platform.notification

import android.app.NotificationManager
import android.content.Context

object NotificationManagerHelper {

    const val NOTIFICATION_ID = 1

    fun show(
        context: Context,
        title: String,
        artist: String,
        isPlaying: Boolean,
    ) {

        NotificationChannelHelper.create(context)

        val notification = NotificationFactory.create(
            context = context,
            title = title,
            artist = artist,
            isPlaying = isPlaying,
        )

        val manager =
            context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        manager.notify(
            NOTIFICATION_ID,
            notification,
        )
    }

    fun update(
        context: Context,
        title: String,
        artist: String,
        isPlaying: Boolean,
    ) {
        show(
            context = context,
            title = title,
            artist = artist,
            isPlaying = isPlaying,
        )
    }
}