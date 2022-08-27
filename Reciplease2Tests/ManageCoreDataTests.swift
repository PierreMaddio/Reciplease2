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
    var persistentContainer: NSPersistentContainer!
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        persistentContainer = .inMemoryContainer()
    }
    func testAddFavorite() {
        let sut = ManageCoreData(container: persistentContainer)
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
    
    func makeRecipe(label: String) -> Recipe {
        return Recipe(label: label, image: UUID().uuidString, url: UUID().uuidString, yield: Int.random(in: 0...50), ingredientLines: [UUID().uuidString], totalTime: 0)
    }
}

extension NSPersistentContainer {
    static func inMemoryContainer() -> NSPersistentContainer {
        let desc = NSPersistentStoreDescription()
        desc.type = NSInMemoryStoreType
        
        let container = NSPersistentContainer(name: CoreDataStack.modelName,
                                              managedObjectModel: CoreDataStack.model)
        container.persistentStoreDescriptions = [desc]
        return container
    }
}







