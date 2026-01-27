package com.russellmiller.iprep.shared.services

import kotlinx.cinterop.ExperimentalForeignApi
import platform.Foundation.NSBundle
import platform.Foundation.NSString
import platform.Foundation.NSUTF8StringEncoding
import platform.Foundation.stringWithContentsOfURL

@OptIn(ExperimentalForeignApi::class)
internal actual fun platformLoadQuestionBankJson(): String? {
    val bundle = NSBundle.mainBundle
    val url = bundle.URLForResource(name = "QuestionBank", withExtension = "json") ?: return null
    return NSString.stringWithContentsOfURL(url, encoding = NSUTF8StringEncoding, error = null) as String?
}
