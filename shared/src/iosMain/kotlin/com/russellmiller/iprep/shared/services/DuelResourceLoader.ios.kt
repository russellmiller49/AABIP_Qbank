package com.russellmiller.iprep.shared.services

import kotlinx.cinterop.ExperimentalForeignApi
import kotlinx.cinterop.addressOf
import kotlinx.cinterop.convert
import kotlinx.cinterop.usePinned
import platform.Foundation.NSBundle
import platform.posix.SEEK_END
import platform.posix.fclose
import platform.posix.fopen
import platform.posix.fread
import platform.posix.fseek
import platform.posix.ftell
import platform.posix.rewind

@OptIn(ExperimentalForeignApi::class)
internal actual fun loadPearlDiverJson(): String? {
    val path = NSBundle.mainBundle.pathForResource("pearl_diver_cards", "json") ?: return null
    val filePointer = fopen(path, "rb") ?: return null
    return try {
        if (fseek(filePointer, 0, SEEK_END) != 0) return null
        val fileSize = ftell(filePointer)
        if (fileSize <= 0L) return ""
        if (fileSize > Int.MAX_VALUE.toLong()) return null
        rewind(filePointer)
        val byteCount = fileSize.toInt()
        val buffer = ByteArray(byteCount)
        val bytesRead = buffer.usePinned { pinned ->
            fread(pinned.addressOf(0), 1u, byteCount.convert(), filePointer)
        }
        if (bytesRead.toLong() != fileSize) return null
        buffer.decodeToString()
    } finally {
        fclose(filePointer)
    }
}

