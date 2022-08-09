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
    
    //var ingredients: [String] = ["chicken", "lemon"]
    
//    func testGetRecipeShouldPostFailedCallbackIfError() {
//        // Given
//        let recipeService = RecipeService(url: <#T##String#>)
//        // When
//        let expectation = XCTestExpectation(description: "Wait for queue change.")
//        recipeService.getRecipes { result in
//            // Then
//
////            XCTAssertFalse(.success)
////            XCTAssertNil(.recipe)
////            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 0.01)
//    }
    
//        func test1() {
//            let mockRecipeService = RecipeServiceMockSuccess()
//            let service = RecipeService(url: ApiService.completeUrlRequest(ingredients: ingredients))
//
//
//            service.getRecipes { result in
//                switch result {
//                case .success(let obj):
//                    XCTAssertEqual(obj.hits[0].recipe.label, "Nutty chicken & lemon spaghetti")
//                case .failure(let err):
//                    if case AFError.responseSerializationFailed(reason:) = err {
//
//                    } else {
//
//                    }
//                }
//            }
//        }
    
}

import Alamofire

class AlamofireClientRecipesSearchMock: HTTPClient {
    func request(url: URL, completion: @escaping (Result<RecipesSearch, AFError>) -> Void) {
        let json = Data()
        let dataResponse = AFDataResponse<Data?>.init(request: nil, response: nil, data: json, metrics: nil, serializationDuration: .zero, result: .success(json))
        self.decodeRecipesSearch(from: dataResponse, completion: completion)
    }
}

