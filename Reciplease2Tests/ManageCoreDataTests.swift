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
    
//        override func tearDown() {
//          super.tearDown()
//          manageCoreData = nil
//          coreDataStack = nil
//        }
    
    func testAddFavorite() {
        guard let sut = manageCoreData else { return }
        let label = UUID().uuidString
        let recipe = makeRecipe(label: label)
        sut.markAsFavorite(recipe: recipe) { isFavorite in
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
    
    func testAdd3FavoritesAndFetchThem() {
        guard let sut = manageCoreData else { return }
        let label1 = UUID().uuidString
        let label2 = UUID().uuidString
        let recipe1 = makeRecipe(label: label1)
        let recipe2 = makeRecipe(label: label2)
        
        sut.markAsFavorite(recipe: recipe1) { isFavorite in
            let savedToFavorite1 = sut.checkIfFavorite(recipeName: label1)
            XCTAssertTrue(savedToFavorite1)
        }
        
        sut.markAsFavorite(recipe: recipe2) { isFavorite in
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
    
    func makeRecipe(label: String) -> Recipe {
        return Recipe(label: label, image: UUID().uuidString, url: UUID().uuidString, yield: Int.random(in: 0...50), ingredientLines: [UUID().uuidString], totalTime: 0)
    }
}

//class ManageCoreDataTests: XCTestCase {
//    var persistentContainer: NSPersistentContainer!
//    override func setUpWithError() throws {
//        try super.setUpWithError()
//        continueAfterFailure = false
//
//        persistentContainer = .inMemoryContainer()
//    }
//
//    func testAddFavorite() {
//        let sut = ManageCoreData(container: persistentContainer)
//        let label = UUID().uuidString
//        let recipe = makeRecipe(label: label)
//        sut.markAsFavorite(recipe: recipe) { isFavorite in
//            //if isFavorite {
//            print("Calling")
//            let savedToFavorite = sut.checkIfFavorite(recipeName: label)
//            XCTAssertTrue(savedToFavorite)
//            //}
//
//            sut.deleteFromFavorite(recipeName: label) {success in
//                print("Calling... 22")
//                let savedToFavorite = sut.checkIfFavorite(recipeName: label)
//                XCTAssertFalse(savedToFavorite)
//            }
//        }
//    }
//
//    func makeRecipe(label: String) -> Recipe {
//        return Recipe(label: label, image: UUID().uuidString, url: UUID().uuidString, yield: Int.random(in: 0...50), ingredientLines: [UUID().uuidString], totalTime: 0)
//    }
//}
//
//extension NSPersistentContainer {
//    static func inMemoryContainer() -> NSPersistentContainer {
//        let desc = NSPersistentStoreDescription()
//        desc.type = NSInMemoryStoreType
//
//        let container = NSPersistentContainer(name: CoreDataStack.modelName,
//                                              managedObjectModel: CoreDataStack.model)
//        container.persistentStoreDescriptions = [desc]
//        return container
//    }
//}







