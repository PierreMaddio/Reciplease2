//
//  AlamofireClientRecipesSearchMock.swift
//  Reciplease2Tests
//
//  Created by Pierre on 11/08/2022.
//

@testable import Reciplease2
import Alamofire

class AlamofireClientRecipesSearchFake: HTTPClient {
    func request(url: URL, completion: @escaping (Result<RecipesSearch, Error>) -> Void) {
        
        let bundle = Bundle(for: RecipeServiceTestCase.self)
        let url = bundle.url(forResource: "Edamam", withExtension: "json")!
        let json = try! Data(contentsOf: url)
        
        let dataResponse = AFDataResponse<Data?>.init(request: nil, response: nil, data: json, metrics: nil, serializationDuration: .zero, result: .success(json))
        
        self.decodeRecipesSearch(from: dataResponse, completion: completion)
    }
}
