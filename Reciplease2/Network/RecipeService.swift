//
//  RecipeService.swift
//  Reciplease2
//
//  Created by Pierre on 29/07/2022.
//

import Foundation
import Alamofire

class RecipeService {
    
    private let url: String
    typealias recipesCallBack = (_ recipes: RecipesSearch?, _ status: Bool, _ message: String) -> Void
    var callBack: recipesCallBack?
    
    init(url: String) {
        self.url = url
    }
    
    // MARK:- getRecipes
    func getRecipes() {
        AF.request(
            self.url,
            method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: nil,
            interceptor: nil).response {
                (responseData) in
                guard let data = responseData.data else {
                    self.callBack?(nil, false, "")
                    return }
                do {
                    let recipes = try JSONDecoder().decode(RecipesSearch.self, from: data)
                    self.callBack?(recipes, true, "")
                } catch {
                    self.callBack?(nil, false, error.localizedDescription)
                }
            }
    }
    
    func completionHandler(callBack: @escaping recipesCallBack) {
        self.callBack = callBack
    }
}
