package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.*
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

class StudyPlannerService {
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
            lastAnsweredAt = 0L
        ) ?: QuestionStudyState(
            questionId = questionId,
            moduleId = moduleId,
            isCorrect = isCorrect,
            isAnswered = isAnswered,
            timesAnswered = 1,
            timesCorrect = if (isCorrect) 1 else 0,
            lastAnsweredAt = 0L
        )
        
        currentStates[questionId] = updatedState
        _questionStudyStates.value = currentStates
        
        // Update module progress
        updateModuleProgress(moduleId)
    }
    
    private fun updateModuleProgress(moduleId: String) {
        val currentProgress = _studyProgress.value.toMutableMap()
        val moduleStates = _questionStudyStates.value.values.filter { it.moduleId == moduleId }
        
        if (moduleStates.isNotEmpty()) {
            val totalQuestions = moduleStates.size
            val answeredQuestions = moduleStates.count { it.isAnswered }
            val correctAnswers = moduleStates.count { it.isCorrect }
            
            val progress = StudyProgress(
                moduleId = moduleId,
                totalQuestions = totalQuestions,
                answeredQuestions = answeredQuestions,
                correctAnswers = correctAnswers,
                studyStates = moduleStates.associateBy { it.questionId }
            )
            
            currentProgress[moduleId] = progress
            _studyProgress.value = currentProgress
        }
    }
    
    fun getQuestionState(questionId: String): QuestionStudyState? {
        return _questionStudyStates.value[questionId]
    }
    
    fun getModuleProgress(moduleId: String): StudyProgress? {
        return _studyProgress.value[moduleId]
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
        val totalQuestions = allStates.size
        val answeredQuestions = allStates.count { it.isAnswered }
        val correctAnswers = allStates.count { it.isCorrect }
        
        return StudyProgress(
            moduleId = "overall",
            totalQuestions = totalQuestions,
            answeredQuestions = answeredQuestions,
            correctAnswers = correctAnswers,
            studyStates = allStates.associateBy { it.questionId }
        )
    }
    
    fun resetProgress(moduleId: String? = null) {
        if (moduleId != null) {
            val currentStates = _questionStudyStates.value.toMutableMap()
            currentStates.keys.filter { currentStates[it]?.moduleId == moduleId }
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
}
