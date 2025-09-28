package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.*
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

class QuizSessionService(
    private val questionBankService: QuestionBankService,
    private val studyPlannerService: StudyPlannerService
) {
    private val _currentSession = MutableStateFlow<QuizSessionState?>(null)
    val currentSession: StateFlow<QuizSessionState?> = _currentSession.asStateFlow()
    
    fun startSession(configuration: QuizSessionConfiguration): QuizSessionState {
        val questions = when (configuration.mode) {
            is QuizMode.QuickStart -> {
                if (configuration.mode.resume) {
                    // TODO: Load from saved session
                    questionBankService.quickStartQuestions(limit = configuration.questionLimit ?: 10)
                } else {
                    questionBankService.quickStartQuestions(limit = configuration.questionLimit ?: 10)
                }
            }
            is QuizMode.Module -> {
                questionBankService.sessionQuestions(forModule = configuration.mode.id)
            }
            is QuizMode.IncorrectOnly -> {
                val incorrectQuestions = studyPlannerService.getQuestionsNeedingReview()
                // Convert to QuizSessionQuestion format
                incorrectQuestions.mapNotNull { state ->
                    questionBankService.sessionQuestion(
                        reference = QuizSessionQuestionReference(
                            moduleID = state.moduleId,
                            questionID = state.questionId
                        )
                    )
                }
            }
        }
        
        val session = QuizSessionState(
            configuration = configuration,
            questions = questions,
            currentQuestionIndex = 0,
            answers = emptyMap(),
            startTime = 0L,
            isCompleted = false
        )
        
        _currentSession.value = session
        return session
    }
    
    fun answerQuestion(questionId: String, answerId: String) {
        val currentSession = _currentSession.value ?: return
        val question = currentSession.questions.find { it.question.id == questionId } ?: return
        
        val updatedAnswers = currentSession.answers + (questionId to answerId)
        val isCorrect = question.question.correctOptionId == answerId
        
        // Update study state
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
    
    fun completeSession() {
        val currentSession = _currentSession.value ?: return
        
        val completedSession = currentSession.copy(isCompleted = true)
        _currentSession.value = completedSession
    }
    
    fun endSession() {
        _currentSession.value = null
    }
    
    fun getSessionResults(): QuizSessionResults? {
        val session = _currentSession.value ?: return null
        
        return QuizSessionResults(
            session = session,
            score = session.score,
            totalQuestions = session.totalQuestions,
            accuracy = if (session.totalQuestions > 0) session.score.toFloat() / session.totalQuestions else 0f,
            timeSpent = 0L,
            questionsAnswered = session.answers.size
        )
    }
}

data class QuizSessionResults(
    val session: QuizSessionState,
    val score: Int,
    val totalQuestions: Int,
    val accuracy: Float,
    val timeSpent: Long,
    val questionsAnswered: Int
)
