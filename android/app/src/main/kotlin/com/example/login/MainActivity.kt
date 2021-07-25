package com.example.login

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.widget.Toast

import androidx.annotation.NonNull
import androidx.annotation.Nullable

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override protected fun onCreate(@Nullable savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) !== PackageManager.PERMISSION_GRANTED) {
                requestPermissions(arrayOf<String>(Manifest.permission.ACCESS_FINE_LOCATION), 0)
            }
        }
    }

}
