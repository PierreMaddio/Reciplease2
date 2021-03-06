//
//  AppDelegate.swift
//  Reciplease2
//
//  Created by Pierre on 15/07/2022.
//

import UIKit
import CoreData

var db: NSPersistentContainer {
    (UIApplication.shared.delegate as! AppDelegate).persistentContainer
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // createInitialData()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Reciplease2")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
    // MARK: - Others
    
//    func createInitialData() {
//        
//        let recipe = NSEntityDescription.insertNewObject(forEntityName: "CDRecipe", into: db.viewContext) as! CDRecipe
//        recipe.attr_name = "first recipe"
//        
//        let chickenIngridient = NSEntityDescription.insertNewObject(forEntityName: "CDIngredient", into: db.viewContext) as! CDIngredient
//        chickenIngridient.attr_name = "chicken"
//        
//        recipe.rel_ingredient = [chickenIngridient]
//        
//        let result = try? db.viewContext.save()
//    }
}

