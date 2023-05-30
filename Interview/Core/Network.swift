//
//  Network.swift
//  Interview
//
//  Created by Chris Anderson on 4/15/21.
//

import Foundation
import Alamofire

class Network {
    func getContent(completion: @escaping (Result<Month, Error>) -> Void) {
        AF.request("https://hallow.com/interview/activity.json", method: .get)
            .responseDecodable(of: [Day].self, decoder: JSONDecoder()) { response in
                if let error = response.error {
                    completion(.failure(error))
                }

                // Data is already decoded as array of `Day`s
                print(response.result)

                // TODO: Finish creating models
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
