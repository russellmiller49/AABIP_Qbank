package com.russellmiller.iprep.shared.services

import kotlinx.cinterop.ExperimentalForeignApi
import kotlinx.cinterop.addressOf
import kotlinx.cinterop.usePinned
import platform.Foundation.NSBundle
import platform.Foundation.NSFileManager
import platform.posix.memcpy

@OptIn(ExperimentalForeignApi::class)
internal actual fun loadQuestionBankJson(): String? {
    val path = NSBundle.mainBundle.pathForResource("QuestionBank", "json") ?: return null
    val data = NSFileManager.defaultManager.contentsAtPath(path) ?: return null
    val length = data.length.toInt()
    if (length == 0) return ""
    val bytes = data.bytes ?: return null
    val byteArray = ByteArray(length).apply {
        usePinned {
            memcpy(it.addressOf(0), bytes, data.length)
        }
    }
    return byteArray.decodeToString()
}
