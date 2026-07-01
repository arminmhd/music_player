package com.example.my_player.platform.notification

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import androidx.core.content.ContextCompat

class NotificationReceiver : BroadcastReceiver() {

    override fun onReceive(
        context: Context,
        intent: Intent,
    ) {

        val serviceIntent = Intent(
            context,
            PlayerNotificationService::class.java,
        ).apply {
            action = intent.action
        }

        ContextCompat.startForegroundService(
          context,
          serviceIntent,
        )
    }
}