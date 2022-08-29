//
//  ManageCoreDataTests.swift
//  Reciplease2Tests
//
//  Created by Pierre on 26/08/2022.
//

@testable import Reciplease2
import CoreData

import XCTest

class ManageCoreDataTests: XCTestCase {
    // MARK: - Properties
    var manageCoreData: ManageCoreData!
    var coreDataStack: CoreDataStack!
    
    override func setUp() {
        super.setUp()
        coreDataStack = TestCoreDataStack()
        manageCoreData = ManageCoreData(container: coreDataStack.storeContainer)
    }
    
    func testAddAndDeleteFavorite() {
        guard let sut = manageCoreData else { return }
        let label = UUID().uuidString
        let recipe = makeRecipe(label: label)
        sut.addAsFavorite(recipe: recipe) { isFavorite in
            //if isFavorite {
            print("Calling")
            let savedToFavorite = sut.checkIfFavorite(recipeName: label)
            XCTAssertTrue(savedToFavorite)
            //}

            sut.deleteFromFavorite(recipeName: label) {success in
                print("Calling... 22")
                let savedToFavorite = sut.checkIfFavorite(recipeName: label)
                XCTAssertFalse(savedToFavorite)
            }
        }
    }
    
    func testFavoriteWithNoTotalTime() {
        guard let sut = manageCoreData else { return }
        let label = UUID().uuidString
        let recipe = makeRecipe(label: label, totalTime: nil)
        sut.addAsFavorite(recipe: recipe) { _ in
            //if isFavorite {
            print("Calling")
            let isFavorite = sut.checkIfFavorite(recipeName: label)
            XCTAssertTrue(isFavorite)
            //}
            sut.fetchFavorites { recipes in
                XCTAssertTrue(recipes.count == 1)
                XCTAssertTrue(recipes[0].totalTime == 0)
            }
        }
    }
    
    func testAdd2FavoritesAndFetchThem() {
        guard let sut = manageCoreData else { return }
        let label1 = UUID().uuidString
        let label2 = UUID().uuidString
        let recipe1 = makeRecipe(label: label1)
        let recipe2 = makeRecipe(label: label2)
        
        sut.addAsFavorite(recipe: recipe1) { isFavorite in
            let savedToFavorite1 = sut.checkIfFavorite(recipeName: label1)
            XCTAssertTrue(savedToFavorite1)
        }
        
        sut.addAsFavorite(recipe: recipe2) { isFavorite in
            let savedToFavorite2 = sut.checkIfFavorite(recipeName: label2)
            XCTAssertTrue(savedToFavorite2)
        }
        
        sut.fetchFavorites { recipes in
            XCTAssertNotNil(recipes)
            XCTAssertTrue(recipes.count == 2)
            XCTAssertTrue(recipe1.label == label1)
            XCTAssertTrue(recipe2.label == label2)
        }
    }
    
    func makeRecipe(label: String, totalTime: Int? = 20) -> Recipe {
        return Recipe(label: label, image: UUID().uuidString, url: UUID().uuidString, yield: Int.random(in: 0...50), ingredientLines: [UUID().uuidString], totalTime: totalTime)
    }
}








