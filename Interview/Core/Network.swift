//
//  Network.swift
//  Interview
//
//  Created by Chris Anderson on 4/15/21.
//

import Foundation
import Alamofire

class Network {

    /// Fetches the user's activity. The resulting array of Days can be assumed to be contiguous and
    /// in ascending order by date
    func getActivity(completion: @escaping (Result<[Day], Error>) -> Void) {
        AF.request("https://hallow.com/interview/activity.json", method: .get)
            .responseDecodable(of: [Day].self, decoder: JSONDecoder()) { response in
                // TODO: Finish creating models
                completion(response.result)
        }
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
