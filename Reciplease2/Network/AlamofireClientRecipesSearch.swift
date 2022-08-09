//
//  AlamofireClient.swift
//  Reciplease2
//
//  Created by Pierre on 09/08/2022.
//

import Foundation
import Alamofire

protocol HTTPClient {
    func request(url: URL, completion: @escaping (Result<RecipesSearch, AFError>) -> Void)
    func decodeRecipesSearch(from response: AFDataResponse<Data?>, completion: @escaping (Result<RecipesSearch, AFError>) -> Void)
}

extension HTTPClient {
    func decodeRecipesSearch(from response: AFDataResponse<Data?>, completion: @escaping (Result<RecipesSearch, AFError>) -> Void) {
        guard let data = response.data else {
            completion(.failure(.responseValidationFailed(reason: .dataFileNil)))
            return
        }
        do {
            let recipes = try JSONDecoder().decode(RecipesSearch.self, from: data)
            completion(.success(recipes))
        } catch {
            completion(.failure(.responseSerializationFailed(reason: .decodingFailed(error: ApiError.decodingFailedBecauseOfModelIsWrong))))
        }
    }
}

class AlamofireClientRecipesSearch: HTTPClient {
    func request(url: URL, completion: @escaping (Result<RecipesSearch, AFError>) -> Void) {
        AF.request(
            url,
            method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: nil,
            interceptor: nil).response {
                (responseData) in
                self.decodeRecipesSearch(from: responseData, completion: completion)
            }
    }
}

