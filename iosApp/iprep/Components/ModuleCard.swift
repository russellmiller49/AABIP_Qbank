import SwiftUI

struct ModuleCard: View {
    let module: Module
    let isDownloaded: Bool
    let onTapDownload: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(module.title)
                .font(Typography.heading())
                .foregroundStyle(Color.primary)

            Text(module.description_)
                .font(.body)
                .foregroundStyle(Color.secondary)
                .lineLimit(3)

            HStack(spacing: 16) {
                Label("\(module.questionCount) questions", systemImage: "questionmark.circle")
                    .font(Typography.caption())
                    .foregroundStyle(Color.secondary)
                Label("~\(module.estimatedTimeMinutes) min", systemImage: "clock")
                    .font(Typography.caption())
                    .foregroundStyle(Color.secondary)
            }

            Spacer(minLength: 0)

            Button(action: onTapDownload) {
                Label(isDownloaded ? "Downloaded" : "Download", systemImage: isDownloaded ? "checkmark.circle.fill" : "arrow.down.circle")
                    .font(Typography.bodyEmphasis())
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(isDownloaded ? Color.ipMutedAccent : Color.ipAccent)
            .disabled(isDownloaded)
            .opacity(isDownloaded ? 0.75 : 1.0)
            .accessibilityLabel(Text(isDownloaded ? "Module \(module.title) downloaded" : "Download module \(module.title)"))
            .accessibilityHint(Text(isDownloaded ? "Already available for offline study" : "Downloads all offline content"))
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 180)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 2)
    }
}
