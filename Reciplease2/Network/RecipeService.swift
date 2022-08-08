//
//  RecipeService.swift
//  Reciplease2
//
//  Created by Pierre on 29/07/2022.
//

import Foundation
import Alamofire

enum ApiError: Error {
    case decodingFailedBecauseOfModelIsWrong
}

protocol RecipeServiceProtocol {
    func getRecipes(completion: @escaping (Result<RecipesSearch, AFError>) -> Void)
}

class RecipeService: RecipeServiceProtocol {
    
    private let url: String
    
    init(url: String) {
        self.url = url
    }
    
    func getRecipes(completion: @escaping (Result<RecipesSearch, AFError>) -> Void) {
        AF.request(
            self.url,
            method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: nil,
            interceptor: nil).response {
                (responseData) in
                guard let data = responseData.data else {
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
}
