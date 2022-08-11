//
//  AlamofireClientRecipesSearchMock.swift
//  Reciplease2Tests
//
//  Created by Pierre on 11/08/2022.
//

@testable import Reciplease2
import Alamofire

class AlamofireClientRecipesSearchMock: HTTPClient {
    func request(url: URL, completion: @escaping (Result<RecipesSearch, AFError>) -> Void) {
        
        let bundle = Bundle(for: RecipeServiceTestCase.self)
        let json = NSDataAsset(name: "Recipe", bundle: bundle)!.data

        let dataResponse = AFDataResponse<Data?>.init(request: nil, response: nil, data: json, metrics: nil, serializationDuration: .zero, result: .success(json))
        
        self.decodeRecipesSearch(from: dataResponse, completion: completion)
    }
}

class AlamofireClientRecipesSearchMockFail: HTTPClient {
    func request(url: URL, completion: @escaping (Result<RecipesSearch, AFError>) -> Void) {
        
        let bundle = Bundle(for: RecipeServiceTestCase.self)
        let json = NSDataAsset(name: "Recipe-WithBrokenHitsField", bundle: bundle)!.data

        let dataResponse = AFDataResponse<Data?>.init(request: nil, response: nil, data: json, metrics: nil, serializationDuration: .zero, result: .success(json))
        
        self.decodeRecipesSearch(from: dataResponse, completion: completion)
    }
}
