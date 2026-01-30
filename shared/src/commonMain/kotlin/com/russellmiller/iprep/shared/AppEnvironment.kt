package com.russellmiller.iprep.shared

import com.russellmiller.iprep.shared.services.*

class AppEnvironment {
    val questionBankService: QuestionBankService
    val featureFlagsService: FeatureFlagsService
    val studyPlannerService: StudyPlannerService
    val quizSessionService: QuizSessionService
    val duelQuestionBankService: DuelQuestionBankService
    val duelEngineService: DuelEngineService
    
    init {
        questionBankService = QuestionBankService()
        featureFlagsService = FeatureFlagsService()
        studyPlannerService = StudyPlannerService()
        quizSessionService = QuizSessionService(questionBankService, studyPlannerService)

        duelQuestionBankService = DuelQuestionBankService()
        loadPearlDiverJson()?.let { jsonString ->
            duelQuestionBankService.loadQuestions(jsonString)
        }
        duelEngineService = DuelEngineService(duelQuestionBankService)
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
