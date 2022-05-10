package com.example.myapp

import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("7f8442eb-e9f8-4746-bb39-36231bac943e") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
  }
}
