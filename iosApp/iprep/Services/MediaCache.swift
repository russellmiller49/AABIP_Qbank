import Foundation

protocol MediaCacheType: AnyObject {
    func cachedFileURL(for remotePath: String) -> URL?
    func cache(data: Data, remotePath: String) throws -> URL
}

final class MediaCache: MediaCacheType {
    private let fileManager: FileManager
    private let cacheDirectory: URL
    private let queue = DispatchQueue(label: "MediaCache.queue", qos: .utility)

    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
        let directory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first ?? URL(fileURLWithPath: NSTemporaryDirectory())
        let cachePath = directory.appendingPathComponent("MediaCache", isDirectory: true)
        if !fileManager.fileExists(atPath: cachePath.path) {
            try? fileManager.createDirectory(at: cachePath, withIntermediateDirectories: true)
        }
        self.cacheDirectory = cachePath
    }

    func cachedFileURL(for remotePath: String) -> URL? {
        let filename = sanitizedFilename(from: remotePath)
        let destination = cacheDirectory.appendingPathComponent(filename)
        return fileManager.fileExists(atPath: destination.path) ? destination : nil
    }

    func cache(data: Data, remotePath: String) throws -> URL {
        let filename = sanitizedFilename(from: remotePath)
        let destination = cacheDirectory.appendingPathComponent(filename)
        var writeError: Error?
        queue.sync {
            do {
                try data.write(to: destination, options: [.atomic])
            } catch {
                writeError = error
            }
        }
        if let error = writeError {
            throw error
        }
        return destination
    }

    private func sanitizedFilename(from remotePath: String) -> String {
        Data(remotePath.utf8)
            .base64EncodedString()
            .replacingOccurrences(of: "/", with: "-")
    }
}
