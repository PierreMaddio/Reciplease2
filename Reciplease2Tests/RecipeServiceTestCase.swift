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
                    "2 tbsp olive oil"
                ])
                
                let image = obj.hits[0].recipe.image
                    XCTAssertEqual(image, "https://edamam-product-images.s3")
                
                let yield = obj.hits[0].recipe.yield
                XCTAssertEqual(yield, 4)
                
                let totalTime = obj.hits[0].recipe.totalTime
                XCTAssertEqual(totalTime, 30)
                
                let hrefNextTwentyRecipes = obj.links.next.href
                XCTAssertEqual(hrefNextTwentyRecipes, "https://api.edamam.com/api/recipes/v2")
                
                expectation.fulfill()
            case .failure:
                XCTFail("Something wrong with my model")
            }
        }
        waitForExpectations(timeout: 1)
    }

}


