package com.example.supercoder_test

import android.app.Activity
import android.content.Intent
import android.graphics.Bitmap
import android.net.Uri
import android.provider.OpenableColumns
import androidx.activity.result.contract.ActivityResultContracts
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.IOException

class MainActivity : FlutterFragmentActivity() {
    private val CHANNEL = "native_file_service"

    private var pendingResult: MethodChannel.Result? = null

    private val pickImageLauncher =
            registerForActivityResult(ActivityResultContracts.GetContent()) { uri: Uri? ->
                uri?.let { pendingResult?.success(it.toString()) } ?: pendingResult?.success(null)
                pendingResult = null
            }

    private val takePhotoLauncher =
            registerForActivityResult(ActivityResultContracts.TakePicturePreview()) { bitmap ->
                if (bitmap != null) {
                    val file = File(cacheDir, "photo_${System.currentTimeMillis()}.jpg")
                    file.outputStream().use { out ->
                        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, out)
                    }
                    pendingResult?.success(file.absolutePath)
                } else {
                    pendingResult?.success(null)
                }
                pendingResult = null
            }

    private val pickPdfLauncher =
            registerForActivityResult(ActivityResultContracts.GetContent()) { uri: Uri? ->
                uri?.let { pendingResult?.success(it.toString()) } ?: pendingResult?.success(null)
                pendingResult = null
            }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call,
                result ->
            when (call.method) {
                "pickImageFromGallery" -> {
                    pendingResult = result
                    pickImageLauncher.launch("image/*")
                }
                "takePhoto" -> {
                    pendingResult = result
                    takePhotoLauncher.launch(null)
                }
                "pickPdf" -> {
                    pendingResult = result
                    pickPdfLauncher.launch("application/pdf")
                }
                "getFileBytes" -> {
                    val fileIdentifier = call.arguments as? String
                    if (fileIdentifier != null) {
                        try {
                            val bytes = getFileBytesFromIdentifier(fileIdentifier)
                            result.success(bytes)
                        } catch (e: Exception) {
                            result.error("FILE_READ_ERROR", "Failed to read file: ${e.message}", null)
                        }
                    } else {
                        result.error("INVALID_ARGUMENT", "File identifier is null", null)
                    }
                }
                "getFileName" -> {
                    val fileIdentifier = call.arguments as? String
                    if (fileIdentifier != null) {
                        try {
                            val filename = getFileNameFromIdentifier(fileIdentifier)
                            result.success(filename)
                        } catch (e: Exception) {
                            result.error("FILE_READ_ERROR", "Failed to read file: ${e.message}", null)
                        }
                    } else {
                        result.error("INVALID_ARGUMENT", "File identifier is null", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun getFileBytesFromIdentifier(fileIdentifier: String): ByteArray? {
        return try {
            if (fileIdentifier.startsWith("content://")) {
                val uri = Uri.parse(fileIdentifier)
                contentResolver.openInputStream(uri)?.use { inputStream ->
                    inputStream.readBytes()
                }
            } else {
                val file = File(fileIdentifier)
                if (file.exists()) {
                    file.readBytes()
                } else {
                    null
                }
            }
        } catch (e: IOException) {
            null
        }
    }

    private fun getFileNameFromIdentifier(fileIdentifier: String): String? {
        return try {
            if (fileIdentifier.startsWith("content://")) {
                val uri = Uri.parse(fileIdentifier)
                contentResolver.query(uri, null, null, null, null)?.use { cursor -> 
                    val nameIndex = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME)
                    cursor.moveToFirst()
                    cursor.getString(nameIndex)
                }
            } else {
                val file = File(fileIdentifier)
                if (file.exists()) {
                    file.getName()
                } else {
                    null
                }
            }
        } catch (e: IOException) {
            null
        }
    }
}
