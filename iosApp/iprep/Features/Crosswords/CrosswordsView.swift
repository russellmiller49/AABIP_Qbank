import SwiftUI

struct CrosswordPuzzle: Identifiable, Hashable {
    let id: String
    let title: String
    let subtitle: String

    static let all: [CrosswordPuzzle] = [
        CrosswordPuzzle(
            id: "crossword1",
            title: "Interventional Pulmonology Board Review",
            subtitle: "Interactive crossword • High-yield concepts"
        ),
        CrosswordPuzzle(
            id: "crossword2",
            title: "IP Board Review Crossword",
            subtitle: "Interactive crossword • Mixed topics"
        ),
        CrosswordPuzzle(
            id: "crossword3",
            title: "Interventional & Pleural Crossword",
            subtitle: "Interactive crossword • Interventional + pleural"
        )
    ]
}

struct CrosswordsView: View {
    private let puzzles = CrosswordPuzzle.all

    var body: some View {
        List {
            Section("Puzzles") {
                ForEach(puzzles) { puzzle in
                    NavigationLink(value: AppRoute.crossword(puzzleId: puzzle.id, title: puzzle.title)) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(puzzle.title)
                                .font(.headline)
                            Text(puzzle.subtitle)
                                .font(.subheadline)
                                .foregroundStyle(Color.secondary)
                        }
                    }
                    .listRowBackground(Color.ipSurface)
                }
            }

            Section {
                Text("Tip: Tap a clue to highlight its answer. Use Reveal All for study mode.")
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
            }
            .listRowBackground(Color.ipSurface)
        }
        .listStyle(.insetGrouped)
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Crossword Puzzles")
    }
}

