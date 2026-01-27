package com.russellmiller.iprep.shared.services

import platform.Foundation.NSBundle
import platform.Foundation.NSString
import platform.Foundation.NSUTF8StringEncoding

internal actual fun loadQuestionBankJson(): String? {
    val path = NSBundle.mainBundle.pathForResource("QuestionBank", "json") ?: return null
    return NSString.stringWithContentsOfFile(path, NSUTF8StringEncoding, null) as String?
}
