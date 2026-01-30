import SwiftUI
import WebKit

struct CrosswordPuzzleView: View {
    let puzzleId: String
    let title: String

    private var puzzleURL: URL? {
        Bundle.main.url(forResource: puzzleId, withExtension: "html")
    }

    var body: some View {
        Group {
            if let puzzleURL {
                CrosswordWebView(url: puzzleURL)
                    .ignoresSafeArea(edges: .bottom)
            } else {
                ContentUnavailableView(
                    "Puzzle not found",
                    systemImage: "questionmark.folder",
                    description: Text("Missing \(puzzleId).html from app resources.")
                )
                .padding()
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.ipBackground.ignoresSafeArea())
    }
}

private struct CrosswordWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard uiView.url != url else { return }
        uiView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
    }
}

