package com.example.lsl_calculator

import android.os.Bundle
import android.view.View
import io.flutter.embedding.android.FlutterActivity
import android.app.ActivityManager
import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.content.Context

class MainActivity: FlutterActivity() {
    override fun onResume() {
        super.onResume()
        window.decorView.systemUiVisibility = (
            View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
            or View.SYSTEM_UI_FLAG_FULLSCREEN
            or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
            or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
            or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
        )

        startLockTask() // Start Android kiosk LockTask mode
    }
}
