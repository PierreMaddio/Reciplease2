//
//  TestCoreDataStack.swift
//  Reciplease2Tests
//
//  Created by Pierre on 26/08/2022.
//

import CoreData
import Reciplease2

class TestCoreDataStack: CoreDataStack {
    override init() {
        super.init()
        
        // Creates an in-memory persistent store
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType
        
        // Creates an NSPersistentContainer instance, passing in the modelName and NSManageObjectModel stored in the CoreDataStack
        let container = NSPersistentContainer(
            name: CoreDataStack.modelName,
            managedObjectModel: CoreDataStack.model)
        
        // Assigns the in-memory persistent store to the container
        container.persistentStoreDescriptions = [persistentStoreDescription]
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        // Overrides the storeContainer in CoreDataStack
        storeContainer = container
    }
}

