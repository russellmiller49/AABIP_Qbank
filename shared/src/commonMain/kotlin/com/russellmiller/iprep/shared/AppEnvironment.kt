package com.russellmiller.iprep.shared

import com.russellmiller.iprep.shared.models.CompletedQuizSession
import com.russellmiller.iprep.shared.services.FeatureFlagsService
import com.russellmiller.iprep.shared.services.QuestionBankService
import com.russellmiller.iprep.shared.services.QuizSessionService
import com.russellmiller.iprep.shared.services.StudyPlannerService
import kotlinx.coroutines.flow.StateFlow

class AppEnvironment {
    val questionBankService: QuestionBankService
    val featureFlagsService: FeatureFlagsService
    val studyPlannerService: StudyPlannerService
    val quizSessionService: QuizSessionService

    init {
        questionBankService = QuestionBankService()
        featureFlagsService = FeatureFlagsService()
        studyPlannerService = StudyPlannerService(questionBankService)
        quizSessionService = QuizSessionService(questionBankService, studyPlannerService)
    }

    val completedSessions: StateFlow<List<CompletedQuizSession>>
        get() = quizSessionService.completedSessions

    fun resetAllProgress() {
        quizSessionService.endSession()
        quizSessionService.clearHistory()
        studyPlannerService.resetProgress()
    }

    companion object {
        private var INSTANCE: AppEnvironment? = null

        fun getInstance(): AppEnvironment {
            return INSTANCE ?: AppEnvironment().also { INSTANCE = it }
        }

        val shared: AppEnvironment
            get() = getInstance()
    }
}
