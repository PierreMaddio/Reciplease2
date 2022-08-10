//
//  RecipeServiceTestCase.swift
//  Reciplease2Tests
//
//  Created by Pierre on 08/08/2022.
//

import XCTest
@testable import Reciplease2
import Alamofire

class RecipeServiceTestCase: XCTestCase {
    
    var ingredients: [String] = ["chicken", "lemon"]
    var recipes: [Recipe] = []
    
        func test1() {
            let service = RecipeService(url: ApiService.completeUrlRequest(ingredients: ingredients), httpClient: AlamofireClientRecipesSearchMock() as HTTPClient)


            service.getRecipes { result in
                switch result {
                case .success(let obj):
                    XCTAssertEqual(obj.hits[0].recipe.label, "Nutty chicken & lemon spaghetti")
                case .failure(let err):
                    if case AFError.responseSerializationFailed(reason:) = err {

                    } else {

                    }
                }
            }
        }
    
    func testModelRecipeSearchDecodeFromJson() throws {
        
        let urlFake = ApiService.completeUrlRequest(ingredients: ingredients)
        let alamofireClientRecipesSearchMock = AlamofireClientRecipesSearchMock()
        
        let expectation = expectation(description: "")
        alamofireClientRecipesSearchMock.request(url: urlFake) { result in
            switch result {
            case .success(let obj):
                self.recipes = obj.hits.map { $0.recipe }
//                let first = try! XCTUnwrap(self.recipes.first)
//                XCTAssertEqual(first.label, "")
                expectation.fulfill()
            case .failure:
                XCTFail("something wrong with our mock")
            }
        }
        waitForExpectations(timeout: 1)
    }
}

class AlamofireClientRecipesSearchMock: HTTPClient {
    func request(url: URL, completion: @escaping (Result<RecipesSearch, AFError>) -> Void) {
        
        let bundle = Bundle(for: RecipeServiceTestCase.self)
        let json = NSDataAsset(name: "Recipe", bundle: bundle)!.data

        let dataResponse = AFDataResponse<Data?>.init(request: nil, response: nil, data: json, metrics: nil, serializationDuration: .zero, result: .success(json))
        
        self.decodeRecipesSearch(from: dataResponse, completion: completion)
    }
}

