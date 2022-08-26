//
//  FavoritesRecipesViewController.swift
//  Reciplease2
//
//  Created by Pierre on 21/07/2022.
//

import UIKit
import CoreData

class FavoritesRecipesViewController: UIViewController {
    
    @IBOutlet weak var tableFavoriteRecipes: UITableView!
    
    private var favoriteRecipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableFavoriteRecipes.dataSource = self
        tableFavoriteRecipes.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchFavorites()
    }
    
    func fetchFavorites() {
        let managedObjectContext = AppDelegate.sharedAppDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RecipleaseCoreData")
        
        do {
            let result = try managedObjectContext.fetch(fetchRequest)
            print("Result count =\(result.count)")
            self.favoriteRecipes.removeAll()
            for favorite in result as! [NSManagedObject] {
                guard let label = favorite.value(forKey: "label") as? String else {return}
                guard let image = favorite.value(forKey: "image") as? String else {return}
                guard let url = favorite.value(forKey: "url") as? String else {return}
                guard let yield = favorite.value(forKey: "yield") as? String else {return}
                guard let ingredientLinesString = favorite.value(forKey: "ingredientLines") as? String else {return}
                let ingredientLines = ingredientLinesString.components(separatedBy: "$j%^")
                guard let totalTime = favorite.value(forKey: "totalTime") as? String else {return}
                let recipeCD = Recipe(label: label,
                                      image: image,
                                      url: url,
                                      yield:Int(yield)!,
                                      ingredientLines: ingredientLines,
                                      totalTime: Int(totalTime))
                self.favoriteRecipes.append(recipeCD)
            }
            
            self.tableFavoriteRecipes.reloadData()
            
        } catch let error {
            print("Error getting favorites == \(error.localizedDescription)")
        }
    }
}

extension FavoritesRecipesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favoriteRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let recipe = favoriteRecipes[indexPath.row]
        cell.configure(recipe: recipe)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "detailRecipe") as? DetailRecipeViewController {
            vc.recipe = favoriteRecipes[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension FavoritesRecipesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118.0
    }
}
