//
//  RecipeService.swift
//  Reciplease2
//
//  Created by Pierre on 29/07/2022.
//

import Foundation
import Alamofire

class RecipeService {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        
        self.httpClient = httpClient
    }
    
    func getRecipes(url: URL, completion: @escaping (Result<RecipesSearch, Error>) -> Void) {
        httpClient.request(url: url, completion: completion)
    }
}
