//
//  CoreDataStack.swift
//  Reciplease2
//
//  Created by Pierre on 20/08/2022.
//

import Foundation
import CoreData

//class CoreDataStack {
//    // MARK: - Properties
//    private let persistentContainerName = "Reciplease2"
//    
//    // MARK: - Singleton
//    
//    static let sharedInstance = CoreDataStack()
//    
//    // MARK: - Public
//    
//    var viewContext: NSManagedObjectContext {
//        return CoreDataStack.sharedInstance.persistentContainer.viewContext
//    }
//    
//    // MARK: - Private
//
//    // lazy pour allouer de la mémoire seulement à son utilisation et non à l'instanciation de l'objet CoreDataStack
//    private lazy var persistentContainer: NSPersistentContainer = {
//      let container = NSPersistentContainer(name: persistentContainerName)
//      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//        if let error = error as NSError? {
//          fatalError("Unresolved error \(error), \(error.userInfo)")
//        }
//      })
//      return container
//    }()
//    
//}
