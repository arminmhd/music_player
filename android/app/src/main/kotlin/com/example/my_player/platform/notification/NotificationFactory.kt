package com.example.my_player.platform.notification

import android.app.Notification
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import androidx.core.app.NotificationCompat

object NotificationFactory {

    fun create(
        context: Context,
        title: String,
        artist: String,
        isPlaying: Boolean,
    ): Notification {

        val previousPending = PendingIntent.getBroadcast(
            context,
            0,
            Intent(context, NotificationReceiver::class.java).apply {
                action = NotificationActions.ACTION_PREVIOUS
            },
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )

        val playPausePending = PendingIntent.getBroadcast(
            context,
            1,
            Intent(context, NotificationReceiver::class.java).apply {
                action =
                    if (isPlaying)
                        NotificationActions.ACTION_PAUSE
                    else
                        NotificationActions.ACTION_PLAY
            },
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )

        val nextPending = PendingIntent.getBroadcast(
            context,
            2,
            Intent(context, NotificationReceiver::class.java).apply {
                action = NotificationActions.ACTION_NEXT
            },
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )

        val stopPending = PendingIntent.getBroadcast(
            context,
            3,
            Intent(context, NotificationReceiver::class.java).apply {
                action = NotificationActions.ACTION_STOP
            },
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )

        val playPauseAction =
            NotificationCompat.Action(
                if (isPlaying)
                    android.R.drawable.ic_media_pause
                else
                    android.R.drawable.ic_media_play,
                if (isPlaying) "Pause" else "Play",
                playPausePending,
            )

        return NotificationCompat.Builder(
            context,
            NotificationChannelHelper.CHANNEL_ID,
        )
            .setSmallIcon(android.R.drawable.ic_media_play)
            .setContentTitle(title)
            .setContentText(artist)
            .setOnlyAlertOnce(true)
            .setOngoing(isPlaying)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .addAction(
                android.R.drawable.ic_media_previous,
                "Previous",
                previousPending,
            )
            .addAction(playPauseAction)
            .addAction(
                android.R.drawable.ic_media_next,
                "Next",
                nextPending,
            )
            .addAction(
                android.R.drawable.ic_menu_close_clear_cancel,
                "Stop",
                stopPending,
            )
            .build()
    }
}