import Combine
import Foundation
import OSLog
#if canImport(Shared)
import Shared
#endif

#if canImport(Shared)
/// Bridges a Kotlin `StateFlow` into a Combine publisher.
final class FlowPublisher<Output> {
    private let flow: SharedKotlinx_coroutines_coreStateFlow
    private let transform: (Any?) -> Output
    private let logger: Logger
    private let subject = PassthroughSubject<Output, Never>()
    private var collector: FlowCollector?
    private var started = false

    init(
        flow: SharedKotlinx_coroutines_coreStateFlow,
        logger: Logger = Logger(
            subsystem: (Bundle.main.bundleIdentifier ?? "com.russellmiller.iprep"),
            category: "FlowPublisher"
        ),
        transform: @escaping (Any?) -> Output
    ) {
        self.flow = flow
        self.transform = transform
        self.logger = logger
    }

    var publisher: AnyPublisher<Output, Never> {
        startIfNeeded()
        return subject.eraseToAnyPublisher()
    }

    private func startIfNeeded() {
        guard !started else { return }
        started = true

        // Emit the current state synchronously.
        subject.send(transform(flow.value))

        let collector = FlowCollector { [weak self] value in
            guard let self else { return }
            self.subject.send(self.transform(value))
        }
        self.collector = collector

        // Collect on a background queue to avoid blocking the main thread.
        DispatchQueue.global(qos: .userInitiated).async { [flow, logger, collector] in
            flow.collect(collector: collector) { error in
                if let error {
                    logger.error("StateFlow collection finished with error: \(error.localizedDescription, privacy: .public)")
                }
            }
        }
    }
}

private final class FlowCollector: NSObject, SharedKotlinx_coroutines_coreFlowCollector {
    private let onEmit: (Any?) -> Void

    init(onEmit: @escaping (Any?) -> Void) {
        self.onEmit = onEmit
    }

    func emit(value: Any?, completionHandler: @escaping (Error?) -> Void) {
        onEmit(value)
        completionHandler(nil)
    }
}
#endif
