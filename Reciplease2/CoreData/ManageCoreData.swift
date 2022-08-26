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
    
}
