package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.CompletedQuizSession
import com.russellmiller.iprep.shared.models.QuizMode
import com.russellmiller.iprep.shared.models.QuizSessionConfiguration
import com.russellmiller.iprep.shared.models.QuizSessionQuestionReference
import com.russellmiller.iprep.shared.models.QuizSessionResults
import com.russellmiller.iprep.shared.models.QuizSessionState
import com.russellmiller.iprep.shared.util.currentTimeMillis
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlin.math.min

class QuizSessionService(
    private val questionBankService: QuestionBankService,
    private val studyPlannerService: StudyPlannerService
) {
    private val _currentSession = MutableStateFlow<QuizSessionState?>(null)
    val currentSession: StateFlow<QuizSessionState?> = _currentSession.asStateFlow()

    private val _completedSessions = MutableStateFlow<List<CompletedQuizSession>>(emptyList())
    val completedSessions: StateFlow<List<CompletedQuizSession>> = _completedSessions.asStateFlow()

    fun startSession(configuration: QuizSessionConfiguration): QuizSessionState {
        val answeredIds = studyPlannerService.questionStudyStates.value.values
            .filter { it.isAnswered }
            .map { it.questionId }
            .toSet()

        val questions = when (configuration.mode) {
            is QuizMode.QuickStart -> {
                questionBankService.quickStartQuestions(
                    limit = configuration.questionLimit ?: DEFAULT_QUICK_START_LIMIT,
                    excluding = if (configuration.mode.resume) emptySet() else answeredIds
                )
            }
            is QuizMode.Module -> {
                val base = questionBankService.sessionQuestions(
                    forModule = configuration.mode.id,
                    excluding = answeredIds
                )
                if (configuration.shuffleQuestions) base.shuffled() else base
            }
            is QuizMode.IncorrectOnly -> {
                val incorrectQuestions = studyPlannerService.getQuestionsNeedingReview()
                val mapped = incorrectQuestions.mapNotNull { state ->
                    questionBankService.sessionQuestion(
                        reference = QuizSessionQuestionReference(
                            moduleID = state.moduleId,
                            questionID = state.questionId
                        )
                    )
                }
                if (configuration.shuffleQuestions) mapped.shuffled() else mapped
            }
        }

        val limitedQuestions = when (configuration.questionLimit) {
            null -> questions
            else -> questions.take(min(configuration.questionLimit, questions.size))
        }

        val session = QuizSessionState(
            configuration = configuration,
            questions = limitedQuestions,
            sessionStartedAt = currentTimeMillis()
        )

        _currentSession.value = session
        return session
    }

    fun answerQuestion(questionId: String, answerId: String) {
        val currentSession = _currentSession.value ?: return
        val question = currentSession.questions.find { it.question.id == questionId } ?: return

        val updatedAnswers = currentSession.answers + (questionId to answerId)
        val isCorrect = question.question.correctOptionId == answerId

        studyPlannerService.updateQuestionState(
            questionId = questionId,
            moduleId = question.module.summary.id,
            isCorrect = isCorrect
        )

        val updatedSession = currentSession.copy(answers = updatedAnswers)
        _currentSession.value = updatedSession
    }

    fun nextQuestion(): Boolean {
        val currentSession = _currentSession.value ?: return false

        if (currentSession.isLastQuestion) {
            completeSession()
            return false
        }

        val updatedSession = currentSession.copy(
            currentQuestionIndex = currentSession.currentQuestionIndex + 1
        )
        _currentSession.value = updatedSession
        return true
    }

    fun previousQuestion(): Boolean {
        val currentSession = _currentSession.value ?: return false

        if (currentSession.currentQuestionIndex <= 0) return false

        val updatedSession = currentSession.copy(
            currentQuestionIndex = currentSession.currentQuestionIndex - 1
        )
        _currentSession.value = updatedSession
        return true
    }

    fun goToQuestion(index: Int): Boolean {
        val currentSession = _currentSession.value ?: return false

        if (index < 0 || index >= currentSession.questions.size) return false

        val updatedSession = currentSession.copy(currentQuestionIndex = index)
        _currentSession.value = updatedSession
        return true
    }

    fun completeSession(): CompletedQuizSession? {
        val currentSession = _currentSession.value ?: return null
        if (currentSession.isCompleted) {
            return _completedSessions.value.firstOrNull { it.sessionId == currentSession.sessionId }
        }

        val completedAt = currentTimeMillis()
        val completedState = currentSession.complete(at = completedAt)
        val completedSession = CompletedQuizSession(
            sessionId = completedState.sessionId,
            startedAt = completedState.sessionStartedAt,
            completedAt = completedAt,
            totalQuestions = completedState.totalQuestions,
            correctCount = completedState.score,
            questionReferences = completedState.questionReferences(),
            selections = completedState.answers,
            configuration = completedState.configuration
        )

        _currentSession.value = completedState
        _completedSessions.value = _completedSessions.value + completedSession
        return completedSession
    }

    fun endSession() {
        _currentSession.value = null
    }

    fun clearHistory() {
        _completedSessions.value = emptyList()
    }

    fun getSessionResults(): QuizSessionResults? {
        val session = _currentSession.value ?: return null

        return QuizSessionResults(
            session = session,
            score = session.score,
            totalQuestions = session.totalQuestions,
            accuracy = session.accuracy,
            timeSpent = session.durationMillis,
            questionsAnswered = session.answers.size
        )
    }

    fun getCompletedSessions(): List<CompletedQuizSession> {
        return _completedSessions.value
    }

    companion object {
        private const val DEFAULT_QUICK_START_LIMIT = 10
    }
}
