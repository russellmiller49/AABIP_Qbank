import Foundation

extension String {
    /// Case and diacritic insensitive substring search.
    func containsInsensitive(_ other: String) -> Bool {
        guard !other.isEmpty else { return true }
        return range(of: other, options: [.caseInsensitive, .diacriticInsensitive]) != nil
    }
}

extension Collection where Element == String {
    /// Lowercases and joins string collections for easier search comparisons.
    func joinedLowercased(separator: String = " ") -> String {
        map { $0.lowercased() }.joined(separator: separator)
    }
}

extension QuizQuestion {
    /// Returns true when any searchable field contains the provided query.
    func matchesQuery(_ rawQuery: String) -> Bool {
        let query = rawQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return true }

        let searchableFields: [String] = [
            prompt,
            explanation,
            references.joined(separator: " "),
            options.map(\.text).joined(separator: " ")
        ]

        if searchableFields.contains(where: { $0.containsInsensitive(query) }) {
            return true
        }

        // Fallback by folding accents to ensure matches for diacritics-heavy content.
        return searchableFields
            .map { $0.folding(options: .diacriticInsensitive, locale: .current) }
            .contains(where: { $0.containsInsensitive(query) })
    }
}

extension QuizSessionQuestion {
    /// Leverages the underlying `QuizQuestion` matcher while considering module metadata.
    func matchesQuery(_ rawQuery: String) -> Bool {
        let query = rawQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return true }

        if question.matchesQuery(query) { return true }

        let moduleFields = [
            module.summary.title,
            module.summary.description_,
            module.summary.difficulty.rawValue
        ]

        return moduleFields.contains(where: { $0.containsInsensitive(query) })
    }
}
