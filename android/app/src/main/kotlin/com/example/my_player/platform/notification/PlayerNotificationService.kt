package com.example.my_player.platform.notification

import android.app.NotificationManager
import android.app.Service
import android.content.Intent
import android.os.IBinder
import android.support.v4.media.session.MediaSessionCompat
import androidx.core.app.ServiceCompat
import android.content.pm.ServiceInfo

class PlayerNotificationService : Service() {

    private lateinit var notificationManager: NotificationManager
    private lateinit var mediaSession: MediaSessionCompat

    override fun onCreate() {
        super.onCreate()

        NotificationChannelHelper.create(this)

        notificationManager =
            getSystemService(NotificationManager::class.java)

        mediaSession = MediaSessionCompat(
            this,
            "MyPlayerSession",
        ).apply {

            isActive = true

            setCallback(
                object : MediaSessionCompat.Callback() {

                    override fun onPlay() {
                        PlayerNotificationBridge.play()
                    }

                    override fun onPause() {
                        PlayerNotificationBridge.pause()
                    }

                    override fun onSkipToNext() {
                        PlayerNotificationBridge.next()
                    }

                    override fun onSkipToPrevious() {
                        PlayerNotificationBridge.previous()
                    }

                    override fun onStop() {
                        PlayerNotificationBridge.stop()
                        stopSelf()
                    }
                },
            )
        }
    }

    override fun onStartCommand(
        intent: Intent?,
        flags: Int,
        startId: Int,
    ): Int {

        val notification = NotificationFactory.create(
            context = this,
            title = "My Player",
            artist = "Unknown Artist",
            isPlaying = false,
        )

        ServiceCompat.startForeground(
            this,
            NotificationManagerHelper.NOTIFICATION_ID,
            notification,
            ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PLAYBACK,
        )

        when (intent?.action) {

            NotificationActions.ACTION_PLAY -> {
                PlayerNotificationBridge.play()
            }

            NotificationActions.ACTION_PAUSE -> {
                PlayerNotificationBridge.pause()
            }

            NotificationActions.ACTION_NEXT -> {
                PlayerNotificationBridge.next()
            }

            NotificationActions.ACTION_PREVIOUS -> {
                PlayerNotificationBridge.previous()
            }

            NotificationActions.ACTION_STOP -> {
                PlayerNotificationBridge.stop()
                stopSelf()
            }
        }

        return START_STICKY
    }

    override fun onDestroy() {

        mediaSession.release()

        stopForeground(STOP_FOREGROUND_REMOVE)

        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? = null
}