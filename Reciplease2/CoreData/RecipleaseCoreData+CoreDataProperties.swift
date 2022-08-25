//
//  RecipleaseCoreData.swift
//  Reciplease2
//
//  Created by Pierre on 19/08/2022.
//

import Foundation
import CoreData

extension RecipleaseCoreData {
    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<RecipleaseCoreData> {
        return NSFetchRequest<RecipleaseCoreData>(entityName: "RecipleaseCoreData")
    }
    
    @NSManaged public var image: String?
    @NSManaged public var ingredientLines: [String]?
    @NSManaged public var label: String?
    @NSManaged public var totalTime: String?
    @NSManaged public var url: String?
    @NSManaged public var yield: String?
    
}
