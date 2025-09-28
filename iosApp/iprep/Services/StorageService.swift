import Foundation

protocol StorageMetadata {
    var etag: String? { get }
    var lastModified: Date? { get }
}

protocol StorageServiceType: AnyObject {
    func signedURL(for path: String) async throws -> URL
    func metadata(for path: String) async throws -> StorageMetadata?
}

struct StubStorageMetadata: StorageMetadata {
    let etag: String?
    let lastModified: Date?
}

final class StorageService: StorageServiceType {
    func signedURL(for path: String) async throws -> URL {
        guard let url = URL(string: "https://example.com/\(path)") else {
            throw URLError(.badURL)
        }
        return url
    }

    func metadata(for path: String) async throws -> StorageMetadata? {
        StubStorageMetadata(etag: UUID().uuidString, lastModified: Date())
    }
}
