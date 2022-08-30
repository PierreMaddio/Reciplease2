//
//  ManageCoreDataService.swift
//  Reciplease2
//
//  Created by Pierre on 25/08/2022.
//

import Foundation
import CoreData

class ManageCoreData {
    static let shared = ManageCoreData()
    let persistentContainer: NSPersistentContainer
    
    init(container: NSPersistentContainer = NSPersistentContainer(name: "Reciplease2")) {
        self.persistentContainer = container
        persistentContainer.loadPersistentStores { description, error in
            if error != nil {
                print("Failed to init core data")
            }
        }
    }
    
    func fetchFavorites(completion: @escaping ([Recipe]) -> Void) {
        let managedObjectContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RecipleaseCoreData")
        
        do {
            let result = try managedObjectContext.fetch(fetchRequest)
            // print("Result count =\(result.count)")
            var favoriteRecipes: [Recipe] = []
            for favorite in result as! [NSManagedObject] {
                guard let label = favorite.value(forKey: "label") as? String else { return }
                guard let image = favorite.value(forKey: "image") as? String else { return }
                guard let url = favorite.value(forKey: "url") as? String else { return }
                guard let yield = favorite.value(forKey: "yield") as? String else { return }
                guard let ingredientLinesString = favorite.value(forKey: "ingredientLines") as? String else { return }
                let ingredientLines = ingredientLinesString.components(separatedBy: "$j%^")
                guard let totalTime = favorite.value(forKey: "totalTime") as? String else {return}
                let recipeCD = Recipe(label: label,
                                      image: image,
                                      url: url,
                                      yield:Int(yield)!,
                                      ingredientLines: ingredientLines,
                                      totalTime: Int(totalTime))
                favoriteRecipes.append(recipeCD)
            }
            completion(favoriteRecipes)
            
        } catch let error {
            completion([])
            print("Error getting favorites == \(error.localizedDescription)")
        }
    }
    
    func checkIfFavorite(recipeName: String) -> Bool {
        let managedObjectContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RecipleaseCoreData")
        fetchRequest.predicate = NSPredicate(format: "label = %@", recipeName )
        do {
            let result = try managedObjectContext.fetch(fetchRequest)
            return result.count == 1 ? true: false
        } catch let error {
            print("Error getting favorites == \(error.localizedDescription)")
        }
        return false
    }
    
    func addFavorite(recipe: Recipe, completion: @escaping (RecipleaseCoreData) -> Void) {
        let managedObjectContext = persistentContainer.viewContext
        let recipeEntity = NSEntityDescription.entity(forEntityName: "RecipleaseCoreData", in: managedObjectContext)!

        let favoriteEntity = NSManagedObject(entity: recipeEntity, insertInto: managedObjectContext)
        favoriteEntity.setValue(recipe.image, forKey: "image")
        favoriteEntity.setValue(recipe.label, forKey: "label")
        favoriteEntity.setValue("\(recipe.totalTime ?? 0)", forKey: "totalTime")
        favoriteEntity.setValue("\((recipe.ingredientLines).joined(separator: "$j%^"))", forKey: "ingredientLines")
        favoriteEntity.setValue(recipe.url, forKey: "url")
        favoriteEntity.setValue("\(recipe.yield)", forKey: "yield")

        try? managedObjectContext.save()

        completion(favoriteEntity as! RecipleaseCoreData)
    }
    
    func deleteFromFavorite(recipeName: String, completion: @escaping (Bool) -> Void) {
        let managedObjectContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RecipleaseCoreData")
        fetchRequest.predicate = NSPredicate(format: "label = %@", recipeName)
        do {
            let result = try managedObjectContext.fetch(fetchRequest)
            for favorite in result as! [NSManagedObject] {
                managedObjectContext.delete(favorite)
            }
            do {
                try managedObjectContext.save()
                completion(true)
            } catch let error {
                completion(false)
                print("Error deleting entry == \(error.localizedDescription)")
            }
        } catch let error {
            completion(false)
            print("Error getting favorites == \(error.localizedDescription)")
        }
    }
}
