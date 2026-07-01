package com.example.my_player.platform.notification

import android.content.Context
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class PlayerNotificationHandler(
    private val context: Context,
) : MethodChannel.MethodCallHandler {
    
    override fun onMethodCall(
        call: MethodCall,
        result: MethodChannel.Result,
    ) {

        val title = call.argument<String>("title") ?: "Unknown"
        val artist = call.argument<String>("artist") ?: "Unknown"
        val isPlaying = call.argument<Boolean>("isPlaying") ?: false

        when (call.method) {

            "show" -> {
                NotificationManagerHelper.show(
                    context = context,
                    title = title,
                    artist = artist,
                    isPlaying = isPlaying,
                )
                result.success(null)
            }

            "play" -> {
                NotificationManagerHelper.update(
                    context = context,
                    title = title,
                    artist = artist,
                    isPlaying = true,
                )
                result.success(null)
            }

            "pause" -> {
                NotificationManagerHelper.update(
                    context = context,
                    title = title,
                    artist = artist,
                    isPlaying = false,
                )
                result.success(null)
            }

            else -> result.notImplemented()
        }
    }
}