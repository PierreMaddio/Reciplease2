//
//  ManageCoreDataService.swift
//  Reciplease2
//
//  Created by Pierre on 25/08/2022.
//

import Foundation
import CoreData

public final class ManageCoreData {
    // MARK: - Properties
    let managedObjectContext: NSManagedObjectContext
    let coreDataStack: CoreDataStack
    
    // MARK: - Initializers
    public init(managedObjectContext: NSManagedObjectContext, coreDataStack: CoreDataStack) {
        self.managedObjectContext = managedObjectContext
        self.coreDataStack = coreDataStack
    }
}

// MARK: - Public
extension ManageCoreData {
    @discardableResult
    public func add(label: String, image: String, url: String, ingredientLines: [String], yield: String, totalTime: String) -> RecipleaseCoreData {
        let recipeCD = RecipleaseCoreData(context: managedObjectContext)
        recipeCD.label = label
        recipeCD.image = image
        recipeCD.url = url
        recipeCD.ingredientLines = ingredientLines
        recipeCD.yield = yield
        recipeCD.totalTime = totalTime
        
        coreDataStack.saveContext(managedObjectContext)
        return recipeCD
    }
    
    public func getRecipes() -> [RecipleaseCoreData]? {
        let reportFetch: NSFetchRequest<RecipleaseCoreData> = RecipleaseCoreData.fetchRequest()
        do {
            let results = try managedObjectContext.fetch(reportFetch)
            return results
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
        return nil
    }
    
    @discardableResult
    public func update(_ recipe: RecipleaseCoreData) -> RecipleaseCoreData {
        coreDataStack.saveContext(managedObjectContext)
        return recipe
    }
    
    public func delete(_ recipe: RecipleaseCoreData) {
        managedObjectContext.delete(recipe)
        coreDataStack.saveContext(managedObjectContext)
    }
}
