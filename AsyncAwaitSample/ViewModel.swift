//
//  ViewModel.swift
//  AsyncAwaitSample
//
//  Created by elkabelaya on 03.11.2021.
//
import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published private(set) var users: [Datum] = []
    
    private var url: URL = .init(string: "https://reqres.in/api/users")!
    init() {
        
    }
    
    func retrieveUsers(){
        Task.init {
            do {
                await users = try getUsers().data
            } catch {
                users = []
            }
        }
    }
    
    private func getUsers() async throws -> Users {
        let session = URLSession.shared
        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(Users.self, from: data)
    }
}

@available(iOS, deprecated: 15.0, message: "Use the built-in API instead")
extension URLSession {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: url) { data, response, error in
                guard let data = data, let response = response else {
                    let error = error ?? URLError(.badServerResponse)
                    return continuation.resume(throwing: error)
                }

                continuation.resume(returning: (data, response))
            }

            task.resume()
        }
    }
}
