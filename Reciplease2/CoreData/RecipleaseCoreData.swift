//
//  RecipleaseCoreData.swift
//  Reciplease2
//
//  Created by Pierre on 19/08/2022.
//

import CoreData

@objc(RecipleaseCoreData)
class RecipleaseCoreData: NSManagedObject {
    
    @NSManaged public var image: String?
    @NSManaged public var ingredientLines: [String]?
    @NSManaged public var label: String?
    @NSManaged public var totalTime: String?
    @NSManaged public var url: String?
    @NSManaged public var yield: String?

}
