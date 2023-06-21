//
//  Network.swift
//  Interview
//
//  Created by Chris Anderson on 4/15/21.
//

import Foundation

class Network {

    /// Fetches the user's activity. The resulting array of Days can be assumed to be contiguous and
    /// in ascending order by date
    func getActivity(completion: @escaping (Result<[Day], Error>) -> Void) {
        let url = URL(string: "https://hallow.com/interview/activity.json")!
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if let error {
                completion(.failure(error))
            }
            if let data {
                do {
                    let days = try JSONDecoder().decode([Day].self, from: data)
                    completion(.success(days))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }

    /// Fetches the first month of the user's activity. Call this version if you are more familiar with
    /// closure-based async handling.
    func getFirstMonth(completion: @escaping (Result<Month, Error>) -> Void) {
        getActivity { result in
            print(result)
            // TODO: Get days that are in first month and pass to completion
        }
    }

    /// Fetches the first month of the user's activity. Call this version if you are more familiar with async await.
    func getFirstMonth() async throws -> Month {
        try await withCheckedThrowingContinuation { continuation in
            getFirstMonth { result in
                continuation.resume(with: result)
            }
        }
    }
}
