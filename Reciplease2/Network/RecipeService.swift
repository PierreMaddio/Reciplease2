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

class RecipeService {
    
    private let url: URL
    private let httpClient: HTTPClient
    
    init(url: URL, httpClient: HTTPClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func getRecipes(completion: @escaping (Result<RecipesSearch, AFError>) -> Void) {
        httpClient.request(url: url, completion: completion)
    }
}
