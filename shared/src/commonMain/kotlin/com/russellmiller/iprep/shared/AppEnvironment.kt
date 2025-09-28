package com.russellmiller.iprep.shared

import com.russellmiller.iprep.shared.services.*

class AppEnvironment {
    val questionBankService: QuestionBankService
    val featureFlagsService: FeatureFlagsService
    val studyPlannerService: StudyPlannerService
    val quizSessionService: QuizSessionService
    
    init {
        questionBankService = QuestionBankService()
        featureFlagsService = FeatureFlagsService()
        studyPlannerService = StudyPlannerService()
        quizSessionService = QuizSessionService(questionBankService, studyPlannerService)
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
