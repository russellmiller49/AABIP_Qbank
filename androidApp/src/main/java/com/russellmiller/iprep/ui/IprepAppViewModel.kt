package com.russellmiller.iprep.ui

import androidx.lifecycle.ViewModel
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.shared.models.CompletedQuizSession
import com.russellmiller.iprep.shared.models.Module
import com.russellmiller.iprep.shared.models.QuizMode
import com.russellmiller.iprep.shared.models.QuizSessionConfiguration
import com.russellmiller.iprep.shared.models.QuizSessionState
import com.russellmiller.iprep.shared.models.StudyProgress
import kotlinx.coroutines.flow.StateFlow

class IprepAppViewModel : ViewModel() {
    private val environment = AppEnvironment.shared

    val moduleSummaries: List<Module> = environment.questionBankService.moduleSummaries()
    val questionBank = environment.questionBankService

    val currentSession: StateFlow<QuizSessionState?> = environment.quizSessionService.currentSession
    val completedSessions: StateFlow<List<CompletedQuizSession>> = environment.completedSessions
    val moduleProgress: StateFlow<Map<String, StudyProgress>> = environment.studyPlannerService.studyProgress
    val questionStudyStates = environment.studyPlannerService.questionStudyStates

    fun startQuickStart(limit: Int = 15): QuizSessionState? {
        val session = environment.quizSessionService.startSession(
            QuizSessionConfiguration(
                mode = QuizMode.QuickStart(resume = false),
                questionLimit = limit
            )
        )

        return session.takeIf { it.questions.isNotEmpty() }
            ?: run {
                environment.quizSessionService.endSession()
                null
            }
    }

    fun resumeSession(): QuizSessionState? {
        val session = environment.quizSessionService.currentSession.value
        return session?.takeIf { it.questions.isNotEmpty() && !it.isCompleted }
    }

    fun startModule(module: Module, limit: Int = module.questionCount): QuizSessionState? {
        val session = environment.quizSessionService.startSession(
            QuizSessionConfiguration(
                mode = QuizMode.Module(id = module.id, title = module.title),
                questionLimit = limit
            )
        )

        return session.takeIf { it.questions.isNotEmpty() }
            ?: run {
                environment.quizSessionService.endSession()
                null
            }
    }

    fun startIncorrectOnly(limit: Int = 10): QuizSessionState? {
        val session = environment.quizSessionService.startSession(
            QuizSessionConfiguration(
                mode = QuizMode.IncorrectOnly,
                questionLimit = limit
            )
        )

        return session.takeIf { it.questions.isNotEmpty() }
            ?: run {
                environment.quizSessionService.endSession()
                null
            }
    }

    fun clearActiveSession() {
        environment.quizSessionService.endSession()
    }

    fun resetAllProgress() {
        environment.resetAllProgress()
    }

    fun getOverallProgress(): StudyProgress {
        return environment.studyPlannerService.getOverallProgress()
    }

    fun getModuleProgress(moduleId: String): StudyProgress? {
        return environment.studyPlannerService.getModuleProgress(moduleId)
    }

    fun completeActiveSession(): CompletedQuizSession? {
        return environment.quizSessionService.completeSession()
    }

    fun completedSessionsSnapshot(): List<CompletedQuizSession> {
        return environment.quizSessionService.getCompletedSessions()
    }

    fun answerQuestion(questionId: String, optionId: String) {
        environment.quizSessionService.answerQuestion(questionId, optionId)
    }

    fun goToNextQuestion(): Boolean {
        return environment.quizSessionService.nextQuestion()
    }

    fun goToPreviousQuestion(): Boolean {
        return environment.quizSessionService.previousQuestion()
    }
}
