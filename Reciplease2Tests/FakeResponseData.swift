//
//  FakeResponseData.swift
//  Reciplease2Tests
//
//  Created by Pierre on 09/08/2022.
//

import Foundation

class FakeResponseData {
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 200, httpVersion: nil, headerFields: nil)!
    
    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class RecipeError: Error {}
    static let error = RecipeError()
    
    static var recipeCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Recipe", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static let quoteIncorrectData = "erreur".data(using: .utf8)!
}
