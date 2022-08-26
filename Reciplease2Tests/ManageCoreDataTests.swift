//
//  ManageCoreDataTests.swift
//  Reciplease2Tests
//
//  Created by Pierre on 26/08/2022.
//

//@testable import Reciplease2
//import CoreData
//
//import XCTest
//
//var manageCoreData: ManageCoreData!
//var coreDataStack: CoreDataStack!
//
//class ManageCoreDataTests: XCTestCase {
//    
//    override func setUp() {
//        super.setUp()
//        coreDataStack = TestCoreDataStack()
//        manageCoreData = ManageCoreData(
//            managedObjectContext: coreDataStack.mainContext,
//            coreDataStack: coreDataStack)
//    }
//    
//    override func tearDown() {
//        super.tearDown()
//        manageCoreData = nil
//        coreDataStack = nil
//    }
//    
//    func testAddRecipe() {
//        // 1 Creates a Recipe
//        let recipe = manageCoreData.add(
//            label: "Nutty chicken & lemon spaghetti",
//            image: "https://edamam-product-images.s3",
//            url: "https://www.bbcgoodfood.com/recipes/nutty-chicken-lemon-spaghetti",
//            ingredientLines: [
//                "4 small boneless and skinless chicken thighs",
//                "2 tbsp olive oil"
//            ],
//            yield: "\(4)",
//            totalTime: "\(30)"
//        )
//        
//        // 2 Asserts the input values match the created RecipleaseCoreData
//        XCTAssertNotNil(recipe, "Report should not be nil")
//        XCTAssertTrue(recipe.label == "Nutty chicken & lemon spaghetti")
//        XCTAssertTrue(recipe.image == "https://edamam-product-images.s3")
//        XCTAssertTrue(recipe.url == "https://www.bbcgoodfood.com/recipes/nutty-chicken-lemon-spaghetti")
//        XCTAssertTrue(recipe.ingredientLines == [
//            "4 small boneless and skinless chicken thighs",
//            "2 tbsp olive oil"])
//        XCTAssertTrue(recipe.yield == "\(4)")
//        XCTAssertTrue(recipe.totalTime == "\(30)")
//        
//    }
//}
