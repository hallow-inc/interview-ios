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

    func getContent(completion: @escaping (Result<Month, Error>) -> Void) {
        getActivity { result in
            print(result)
            // TODO: Get days that are in first month and pass to completion
        }
    }

    func getContent() async throws -> Month {
        try await withCheckedThrowingContinuation { continuation in
            getContent { result in
                continuation.resume(with: result)
            }
        }
    }
}
