import Combine
import Foundation
import Shared

@MainActor
final class DuelViewModel: ObservableObject {
    @Published private(set) var state: Shared.DuelState?
    @Published private(set) var isResolving = false

    private let engine: Shared.DuelEngineService
    private let store: DuelStore

    private var cancellables: Set<AnyCancellable> = []
    private var duelFlow: FlowPublisher<Shared.DuelState?>?
    private var recordedDuelId: String?

    init(engine: Shared.DuelEngineService, store: DuelStore) {
        self.engine = engine
        self.store = store
        bind()
    }

    private func bind() {
        let flow = FlowPublisher(flow: engine.currentDuel) { value in
            value as? Shared.DuelState
        }
        self.duelFlow = flow

        flow.publisher
            .receive(on: RunLoop.main)
            .sink { [weak self] duel in
                self?.state = duel
            }
            .store(in: &cancellables)
    }

    func startDuel(enemyId: String) {
        guard let enemy = Shared.EnemyDefinitions.shared.enemy(id: enemyId) else { return }

        engine.setPlayerContext(
            recentSeen: store.data.recentlySeenQuestionIds,
            recentMissed: store.data.recentlyMissedQuestionIds,
            weakTopics: store.weakTopics()
        )
        recordedDuelId = nil
        _ = engine.startDuel(enemy: enemy)
    }

    func proceedToQuestion() {
        engine.proceedToQuestion()
    }

    func useHint() {
        _ = engine.useHint()
    }

    func useShield() {
        _ = engine.useShield()
    }

    func useDoubleTap() {
        _ = engine.useDoubleTap()
    }

    func submitAnswer(_ answer: Bool) {
        guard let state, let question = state.currentQuestion else { return }
        guard state.phase == .question else { return }

        let topic = question.topic
        let priorStreak = Int(state.currentStreak)
        let newStreak = answer == question.answer ? priorStreak + 1 : 0

        guard let result = engine.submitAnswer(playerAnswer: answer) else { return }

        applyAnswerToProfile(topic: topic, isCorrect: result.isCorrect, streak: newStreak)
        store.updateRecentQuestionIds(
            seen: engine.recentlySeenQuestionIds(),
            missed: engine.recentlyMissedQuestionIds()
        )

        // UI can animate locally before we advance the shared phase.
        isResolving = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self else { return }
            self.engine.showFeedback()
            self.isResolving = false
            self.maybeRecordCompletedDuel()
        }
    }

    func proceedAfterFeedback() {
        engine.proceedToNextQuestion()
    }

    func endDuel() {
        engine.endDuel()
    }

    private func applyAnswerToProfile(topic: String, isCorrect: Bool, streak: Int) {
        let base = store.data.playerProfile
        let mastered = DuelPersistenceKt.updateMastery(profile: base, topic: topic, isCorrect: isCorrect)

        let totalAnswered = mastered.totalAnswered + 1
        let totalCorrect = mastered.totalCorrect + (isCorrect ? 1 : 0)
        let longestStreak = max(Int(mastered.longestStreak), streak)

        let updated = mastered.doCopy(
            id: mastered.id,
            xp: mastered.xp,
            level: mastered.level,
            duelsWon: mastered.duelsWon,
            duelsLost: mastered.duelsLost,
            totalCorrect: totalCorrect,
            totalAnswered: totalAnswered,
            longestStreak: Int32(longestStreak),
            defeatedEnemies: mastered.defeatedEnemies,
            topicMastery: mastered.topicMastery
        )

        store.updateProfile(updated)
    }

    private func maybeRecordCompletedDuel() {
        guard let completed = engine.getCompletedDuel() else { return }
        guard recordedDuelId != completed.id else { return }
        recordedDuelId = completed.id

        applyCompletedDuel(completed)
        store.addCompletedDuel(completed)
        store.updateRecentQuestionIds(
            seen: engine.recentlySeenQuestionIds(),
            missed: engine.recentlyMissedQuestionIds()
        )
    }

    private func applyCompletedDuel(_ duel: Shared.CompletedDuel) {
        let base = store.data.playerProfile
        let newXP = base.xp + duel.xpEarned
        let newLevel = Shared.PlayerProfile.companion.levelForXP(xp: newXP)

        let won = duel.won
        let duelsWon = base.duelsWon + (won ? 1 : 0)
        let duelsLost = base.duelsLost + (!won ? 1 : 0)

        var defeated = Set(base.defeatedEnemies)
        if won {
            defeated.insert(duel.enemyId)
        }

        let longestStreak = max(Int(base.longestStreak), Int(duel.maxStreak))

        let updated = base.doCopy(
            id: base.id,
            xp: newXP,
            level: newLevel,
            duelsWon: duelsWon,
            duelsLost: duelsLost,
            totalCorrect: base.totalCorrect,
            totalAnswered: base.totalAnswered,
            longestStreak: Int32(longestStreak),
            defeatedEnemies: defeated,
            topicMastery: base.topicMastery
        )

        store.updateProfile(updated)
    }
}
