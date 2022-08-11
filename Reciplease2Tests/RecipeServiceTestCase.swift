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
    
    var ingredients: [String]!
    var recipes: [Recipe]!
    
    override func setUp() {
        super.setUp()
        ingredients = ["chicken", "lemon"]
        recipes = []
    }
    
    func testModelRecipeSearchDecodeFromJson() {
        
        let urlFake = ApiService.completeUrlRequest(ingredients: ingredients)
        let alamofireClientRecipesSearchMock = AlamofireClientRecipesSearchMock()
        let expectation1 = expectation(description: "")
        alamofireClientRecipesSearchMock.request(url: urlFake) { result in
            switch result {
            case .success(let obj):
                self.recipes = obj.hits.map { $0.recipe }
                expectation1.fulfill()
            case .failure:
                XCTFail("Ssomething wrong with my mock")
            }
        }
        waitForExpectations(timeout: 1)
    }
    
//    func testModelRecipeSearchDecodeFromJsonFail() {
//        
//        let urlFake = ApiService.completeUrlRequest(ingredients: ingredients)
//        let alamofireClientRecipesSearchMock = AlamofireClientRecipesSearchMockFail()
//        
//        let expectation = expectation(description: "")
//        alamofireClientRecipesSearchMock.request(url: urlFake) { result in
//            switch result {
//            case .success(let obj):
//                self.recipes = obj.hits.map { $0.recipe }
//                expectation.fulfill()
//            case .failure(let err):
//                XCTAssertTrue(err.isResponseSerializationError)
//            }
//        }
//        waitForExpectations(timeout: 2)
//    }
    
    func testModelDecode() {
        let urlFake = ApiService.completeUrlRequest(ingredients: ingredients)
        let alamofireClientRecipesSearchMock = AlamofireClientRecipesSearchMock()
        
        let expectation = expectation(description: "")
        alamofireClientRecipesSearchMock.request(url: urlFake) { result in
            switch result {
            case .success(let obj):
                let label = obj.hits[0].recipe.label
                XCTAssertEqual(label, "Nutty chicken & lemon spaghetti")
                
                let url = obj.hits[0].recipe.url
                XCTAssertEqual(url, "https://www.bbcgoodfood.com/recipes/nutty-chicken-lemon-spaghetti")
                
                let ingredientLines = obj.hits[0].recipe.ingredientLines
                XCTAssertEqual(ingredientLines, [
                    "4 small boneless and skinless chicken thighs",
                    "2 tbsp olive oil",
                    "80g stale white bread , torn into small pieces",
                    "140ml whole milk",
                    "100g walnuts",
                    "1 large garlic clove",
                    "½ lemon , zested and juiced",
                    "300g spaghetti",
                    "1⁄2 small bunch of parsley , finely chopped",
                    "grated parmesan , to serve (optional)"
                ])
                
                let image = obj.hits[0].recipe.image
                    XCTAssertEqual(image, "https://edamam-product-images.s3.amazonaws.com/web-img/2e3/2e3474ba03e6cc5ee50f2e65ba1d59a7.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQCbd%2FPYU6gpX2MghyYNKQ6BOHHqegOvHNBcQ8Nqwh20SwIhANDXkS5iRBSMfQT9JOR%2FLxqC5eUx9l9epBtQc%2FGzX%2BOYKtIECCcQABoMMTg3MDE3MTUwOTg2Igxdj2vO2pe1jie3lpsqrwRLFOY3HRSXvPcAfBXDMoHgq7MjofGHHFno1gLG6YDCAjwN32RI7PDU4SvWBBg2H1wcTab9UfkjTiy7Rr538ipy7YuxmgdTwMvgDNNWnwWpE9lvp2qof4ECG8O1aiKLBx9nJXSC7TRhHFU5qkkJ9W2Mb8hes6IYI6B6RghPPLo5VsereZEJmCmrjDrfAhuD%2BYR3g2Po5nBFad3Bk6NXE%2Foej3fj3TLBuueyNdQi4MxO8h%2FKFQFKDpODf2d6AQJ%2FDWU19dXEszKDnn%2FTCe%2F4EPggW0m0Hh45K9NFyjpARIhkaPKtkOp%2FW97ao%2F94q%2Fyok8YgIzO1ZEHUiO5XoLFubpVZ0T7ZrTKWyoDzPAi8BgBvzxkmScmjIx8TMwytCuTthdIMNbI3V4F02fUvm%2F%2FS4dThsnXTrDQh4tqKX3Gl%2FnVlJc854Ks2d7Nu2Cqh3XqcSwtep3SlR%2FFDOGTOrMlVQp4wu2b4mAgpkhKvL9oKE%2FPNJVMRM5IH1QMy%2BvRJttiaoKQ1MPT61mvOzE4CbjgYeWHfu08rCquJ8IOL5kbNjPvn0RaUFe0FxhTedoAu%2FsJFdm%2BC4gZbjXEaSrijNWrepF62Q6GuqFr%2BEK3lSTOc0u6ulSDmSgmhXoF%2FTCCVI8mV7ypjJysXU8ww4mUgE7hvl8STACyW%2FTdIsMOrhgYRypm23rFbKm97NTqSP3Gm5XsQQn%2F1EbhENIrQgUbWP5CK7ohKsHHVPzzwBpjJUhR1CaM2MNfmx5cGOqgBu6%2Fvi%2B07U2a5K95xv8e9Z15tVjip1KkXXYWFhAOBscgp5jhApWGycPfA59oTe6uQt5OrWLH8aJqQ1AXS9TAhht%2BCP0zwfd6s%2Bi5DMw8vuQw9z%2BdEAYR4rTQbtMDyWWbJPYJt7A8WS8dAlqqDMaJVItS2UIDZT%2FiQ86EcMnwyJmfMPvvZQEtEnAirFdtaVaJpBnRsrFU8WCpyr%2FOE0wkdH6nXHRsHilv1&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220809T070435Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFAW2YZAGN%2F20220809%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=87a717aedb628532a28f163088c3056bad0f7a98695b690c3d86667291421e80")
                
                let yield = obj.hits[0].recipe.yield
                XCTAssertEqual(yield, 4)
                
                let totalTime = obj.hits[0].recipe.totalTime
                XCTAssertEqual(totalTime, 30)
                
                expectation.fulfill()
            case .failure:
                XCTFail("Something wrong with my model")
            }
        }
        waitForExpectations(timeout: 1)
    }
    
//    func testUrlSuccess() {
//        let urlFake = ApiService.completeUrlRequest(ingredients: ingredients)
//        let alamofireClientRecipesSearchMock = AlamofireClientRecipesSearchMock()
//
//        let expectation = expectation(description: "")
//        alamofireClientRecipesSearchMock.request(url: urlFake) { result in
//            switch result {
//            case .success(let obj):
//                let url = obj.hits[0].recipe.url
//                XCTAssertEqual(url, "https://www.bbcgoodfood.com/recipes/nutty-chicken-lemon-spaghetti")
//                expectation.fulfill()
//            case .failure:
//                XCTFail("wrong url")
//            }
//        }
//        waitForExpectations(timeout: 1)
//    }
//
//    func testIngredientLinesSuccess() {
//        let urlFake = ApiService.completeUrlRequest(ingredients: ingredients)
//        let alamofireClientRecipesSearchMock = AlamofireClientRecipesSearchMock()
//
//        let expectation = expectation(description: "")
//        alamofireClientRecipesSearchMock.request(url: urlFake) { result in
//            switch result {
//            case .success(let obj):
//                let ingredientLines = obj.hits[0].recipe.ingredientLines
//                XCTAssertEqual(ingredientLines, [
//                    "4 small boneless and skinless chicken thighs",
//                    "2 tbsp olive oil",
//                    "80g stale white bread , torn into small pieces",
//                    "140ml whole milk",
//                    "100g walnuts",
//                    "1 large garlic clove",
//                    "½ lemon , zested and juiced",
//                    "300g spaghetti",
//                    "1⁄2 small bunch of parsley , finely chopped",
//                    "grated parmesan , to serve (optional)"
//                ])
//                expectation.fulfill()
//            case .failure:
//                XCTFail("wrong url")
//            }
//        }
//        waitForExpectations(timeout: 1)
//    }
//
//    func testImageSuccess() {
//        let urlFake = ApiService.completeUrlRequest(ingredients: ingredients)
//        let alamofireClientRecipesSearchMock = AlamofireClientRecipesSearchMock()
//
//        let expectation = expectation(description: "")
//        alamofireClientRecipesSearchMock.request(url: urlFake) { result in
//            switch result {
//            case .success(let obj):
//                let image = obj.hits[0].recipe.image
//                    XCTAssertEqual(image, "https://edamam-product-images.s3.amazonaws.com/web-img/2e3/2e3474ba03e6cc5ee50f2e65ba1d59a7.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQCbd%2FPYU6gpX2MghyYNKQ6BOHHqegOvHNBcQ8Nqwh20SwIhANDXkS5iRBSMfQT9JOR%2FLxqC5eUx9l9epBtQc%2FGzX%2BOYKtIECCcQABoMMTg3MDE3MTUwOTg2Igxdj2vO2pe1jie3lpsqrwRLFOY3HRSXvPcAfBXDMoHgq7MjofGHHFno1gLG6YDCAjwN32RI7PDU4SvWBBg2H1wcTab9UfkjTiy7Rr538ipy7YuxmgdTwMvgDNNWnwWpE9lvp2qof4ECG8O1aiKLBx9nJXSC7TRhHFU5qkkJ9W2Mb8hes6IYI6B6RghPPLo5VsereZEJmCmrjDrfAhuD%2BYR3g2Po5nBFad3Bk6NXE%2Foej3fj3TLBuueyNdQi4MxO8h%2FKFQFKDpODf2d6AQJ%2FDWU19dXEszKDnn%2FTCe%2F4EPggW0m0Hh45K9NFyjpARIhkaPKtkOp%2FW97ao%2F94q%2Fyok8YgIzO1ZEHUiO5XoLFubpVZ0T7ZrTKWyoDzPAi8BgBvzxkmScmjIx8TMwytCuTthdIMNbI3V4F02fUvm%2F%2FS4dThsnXTrDQh4tqKX3Gl%2FnVlJc854Ks2d7Nu2Cqh3XqcSwtep3SlR%2FFDOGTOrMlVQp4wu2b4mAgpkhKvL9oKE%2FPNJVMRM5IH1QMy%2BvRJttiaoKQ1MPT61mvOzE4CbjgYeWHfu08rCquJ8IOL5kbNjPvn0RaUFe0FxhTedoAu%2FsJFdm%2BC4gZbjXEaSrijNWrepF62Q6GuqFr%2BEK3lSTOc0u6ulSDmSgmhXoF%2FTCCVI8mV7ypjJysXU8ww4mUgE7hvl8STACyW%2FTdIsMOrhgYRypm23rFbKm97NTqSP3Gm5XsQQn%2F1EbhENIrQgUbWP5CK7ohKsHHVPzzwBpjJUhR1CaM2MNfmx5cGOqgBu6%2Fvi%2B07U2a5K95xv8e9Z15tVjip1KkXXYWFhAOBscgp5jhApWGycPfA59oTe6uQt5OrWLH8aJqQ1AXS9TAhht%2BCP0zwfd6s%2Bi5DMw8vuQw9z%2BdEAYR4rTQbtMDyWWbJPYJt7A8WS8dAlqqDMaJVItS2UIDZT%2FiQ86EcMnwyJmfMPvvZQEtEnAirFdtaVaJpBnRsrFU8WCpyr%2FOE0wkdH6nXHRsHilv1&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220809T070435Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFAW2YZAGN%2F20220809%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=87a717aedb628532a28f163088c3056bad0f7a98695b690c3d86667291421e80")
//                expectation.fulfill()
//            case .failure:
//                XCTFail("wrong Image")
//            }
//        }
//        waitForExpectations(timeout: 1)
//    }
}


