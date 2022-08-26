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
        ManageCoreData.shared.fetchFavorites { [weak self] recipes in
            print("Fetching... ", recipes)
            self?.favoriteRecipes = recipes
            self?.tableFavoriteRecipes.reloadData()
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
