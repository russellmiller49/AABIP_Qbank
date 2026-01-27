package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.QuestionStudyState
import com.russellmiller.iprep.shared.models.StudyProgress
import com.russellmiller.iprep.shared.util.currentTimeMillis
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

class StudyPlannerService(
    private val questionBankService: QuestionBankService
) {
    private val _studyProgress = MutableStateFlow<Map<String, StudyProgress>>(emptyMap())
    val studyProgress: StateFlow<Map<String, StudyProgress>> = _studyProgress.asStateFlow()

    private val _questionStudyStates = MutableStateFlow<Map<String, QuestionStudyState>>(emptyMap())
    val questionStudyStates: StateFlow<Map<String, QuestionStudyState>> = _questionStudyStates.asStateFlow()

    fun updateQuestionState(
        questionId: String,
        moduleId: String,
        isCorrect: Boolean,
        isAnswered: Boolean = true
    ) {
        val currentStates = _questionStudyStates.value.toMutableMap()
        val existingState = currentStates[questionId]

        val updatedState = existingState?.copy(
            isCorrect = isCorrect,
            isAnswered = isAnswered,
            timesAnswered = existingState.timesAnswered + 1,
            timesCorrect = if (isCorrect) existingState.timesCorrect + 1 else existingState.timesCorrect,
            lastAnsweredAt = currentTimeMillis()
        ) ?: QuestionStudyState(
            questionId = questionId,
            moduleId = moduleId,
            isCorrect = isCorrect,
            isAnswered = isAnswered,
            timesAnswered = 1,
            timesCorrect = if (isCorrect) 1 else 0,
            lastAnsweredAt = currentTimeMillis()
        )

        currentStates[questionId] = updatedState
        _questionStudyStates.value = currentStates

        updateModuleProgress(moduleId)
    }

    private fun updateModuleProgress(moduleId: String) {
        val moduleStates = _questionStudyStates.value.values.filter { it.moduleId == moduleId }
        val totalQuestions = moduleQuestionCount(moduleId)

        val answeredQuestions = moduleStates.count { it.isAnswered }
        val correctAnswers = moduleStates.count { it.isCorrect }

        val progress = StudyProgress(
            moduleId = moduleId,
            totalQuestions = totalQuestions,
            answeredQuestions = answeredQuestions,
            correctAnswers = correctAnswers,
            studyStates = moduleStates.associateBy { it.questionId }
        )

        val currentProgress = _studyProgress.value.toMutableMap()
        currentProgress[moduleId] = progress
        _studyProgress.value = currentProgress
    }

    fun getQuestionState(questionId: String): QuestionStudyState? {
        return _questionStudyStates.value[questionId]
    }

    fun getModuleProgress(moduleId: String): StudyProgress? {
        val cached = _studyProgress.value[moduleId]
        if (cached != null) return cached

        val totalQuestions = moduleQuestionCount(moduleId)
        if (totalQuestions == 0) return null

        return StudyProgress(
            moduleId = moduleId,
            totalQuestions = totalQuestions,
            answeredQuestions = 0,
            correctAnswers = 0,
            studyStates = emptyMap()
        )
    }

    fun getQuestionsNeedingReview(moduleId: String? = null): List<QuestionStudyState> {
        val states = _questionStudyStates.value.values
        return if (moduleId != null) {
            states.filter { it.moduleId == moduleId && it.needsReview }
        } else {
            states.filter { it.needsReview }
        }
    }

    fun getOverallProgress(): StudyProgress {
        val allStates = _questionStudyStates.value.values
        val answeredQuestions = allStates.count { it.isAnswered }
        val correctAnswers = allStates.count { it.isCorrect }

        return StudyProgress(
            moduleId = "overall",
            totalQuestions = questionBankService.totalQuestionCount,
            answeredQuestions = answeredQuestions,
            correctAnswers = correctAnswers,
            studyStates = allStates.associateBy { it.questionId }
        )
    }

    fun resetProgress(moduleId: String? = null) {
        if (moduleId != null) {
            val currentStates = _questionStudyStates.value.toMutableMap()
            currentStates.keys
                .filter { currentStates[it]?.moduleId == moduleId }
                .forEach { currentStates.remove(it) }
            _questionStudyStates.value = currentStates

            val currentProgress = _studyProgress.value.toMutableMap()
            currentProgress.remove(moduleId)
            _studyProgress.value = currentProgress
        } else {
            _questionStudyStates.value = emptyMap()
            _studyProgress.value = emptyMap()
        }
    }

    private fun moduleQuestionCount(moduleId: String): Int {
        return questionBankService.quizModule(moduleId)?.questions?.size
            ?: questionBankService.moduleSummaries()
                .firstOrNull { it.id == moduleId }?.questionCount
            ?: 0
    }
}
