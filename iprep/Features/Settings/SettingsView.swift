import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
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
    }
}
