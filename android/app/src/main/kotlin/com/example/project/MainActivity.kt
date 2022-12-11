package com.example.project

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister
import io.flutter.plugin.common.MethodChannel
import com.example.project.kotlin.CameraXLivePreviewActivity

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.project/channels"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegister.registerGeneratedPlugins(FlutterEngine(this@MainActivity))
        flutterEngine?.dartExecutor?.let {
            MethodChannel(it,CHANNEL).setMethodCallHandler{ call, _->
                if (call.method.equals("gopose")){
                    gopose()
                }
            }
        }
    }

    private fun gopose(){
        startActivity(Intent(this@MainActivity,CameraXLivePreviewActivity::class.java))
    }
}

