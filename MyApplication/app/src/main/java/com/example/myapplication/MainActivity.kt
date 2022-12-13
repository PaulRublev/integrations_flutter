package com.example.myapplication

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.example.myapplication.databinding.ActivityMainBinding
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private var cachedFlutterEngine: FlutterEngine? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        cachedFlutterEngine =
            FlutterEmbeddingActivity.initialiseFlutterEngine(this,"flutter_engine")
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.fab.setOnClickListener {
            startActivity(
                FlutterActivity.withCachedEngine("flutter_engine").build(this)
            )
        }
    }

}