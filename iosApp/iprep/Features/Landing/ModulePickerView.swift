import SwiftUI
import Shared

struct ModulePickerView: View {
    let modules: [Module]
    let onSelect: (Module) -> Void
    let onCancel: () -> Void

    var body: some View {
        NavigationStack {
            List(modules, id: \.id) { module in
                Button {
                    onSelect(module)
                } label: {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(module.title)
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                        Text("\(module.questionCount) questions • ~\(module.estimatedTimeMinutes) min")
                            .font(.subheadline)
                            .foregroundStyle(Color.secondary)
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("Choose Category")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close", action: onCancel)
                }
            }
        }
    }
}
