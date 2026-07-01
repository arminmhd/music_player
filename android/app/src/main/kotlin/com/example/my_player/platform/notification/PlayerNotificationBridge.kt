package com.example.my_player.platform.notification

import io.flutter.plugin.common.MethodChannel

object PlayerNotificationBridge {

    @Volatile
    var channel: MethodChannel? = null

    fun play() {
        channel?.invokeMethod("play", null)
    }

    fun pause() {
        channel?.invokeMethod("pause", null)
    }

    fun next() {
        channel?.invokeMethod("next", null)
    }

    fun previous() {
        channel?.invokeMethod("previous", null)
    }

    fun stop() {
        channel?.invokeMethod("stop", null)
    }
}