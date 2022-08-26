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

    // 1 Creates an in-memory persistent store
    let persistentStoreDescription = NSPersistentStoreDescription()
    persistentStoreDescription.type = NSInMemoryStoreType

    // 2 Creates an NSPersistentContainer instance, passing in the modelName and NSManageObjectModel stored in the CoreDataStack
    let container = NSPersistentContainer(
      name: CoreDataStack.modelName,
      managedObjectModel: CoreDataStack.model)

    // 3 Assigns the in-memory persistent store to the container
    container.persistentStoreDescriptions = [persistentStoreDescription]

    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }

    // 4 Overrides the storeContainer in CoreDataStack
    storeContainer = container
  }
}

