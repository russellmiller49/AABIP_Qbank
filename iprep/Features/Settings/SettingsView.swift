import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var showResetAlert = false

    var body: some View {
        Form {
            Section("Practice History") {
                Button(role: .destructive) {
                    showResetAlert = true
                } label: {
                    Label("Reset completed questions", systemImage: "arrow.counterclockwise")
                }
                .accessibilityHint(Text("Clears saved sessions so questions can appear again."))
            }

            Section("Preferences") {
                Toggle(isOn: .constant(true)) {
                    Text("Enable reminders")
                }
                .disabled(true)
                .accessibilityHint(Text("Coming soon"))
            }

            Section("About") {
                Text("AABIP iPREP early build")
                Text("Version 0.1")
            }
        }
        .navigationTitle("Settings")
        .alert("Reset practice history?", isPresented: $showResetAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Reset", role: .destructive) {
                environment.resetPracticeProgress()
            }
        } message: {
            Text("This will clear completed quizzes and allow all questions to appear again. This cannot be undone.")
        }
    }
}
