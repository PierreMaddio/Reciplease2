//
//  ListRecipesViewController.swift
//  Reciplease2
//
//  Created by Pierre on 24/07/2022.
//

import UIKit

class ListRecipesViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableRecipes: UITableView!
    var recipes = [Recipe]()
    var ingredients: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableRecipes.dataSource = self
        
        let service = RecipeService(url: "https://api.edamam.com/api/recipes/v2?q=\(ingredients.joined(separator: ","))&app_key=c4ed16eb0795215c47de2959c93d00c4&app_id=7d167a47&type=any")
        
        service.getRecipes()
        service.completionHandler { [weak self] recipes, status, message in
            guard let self = self else { return }
            guard status else { return }
            guard let _recipes = recipes else { return }
            self.recipes = _recipes.hits.map { $0.recipe }
            self.tableRecipes.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "recipeCell")
        }
        let recipe = recipes[indexPath.row]
        cell?.textLabel?.text = recipe.label
        
        return cell!
    }

}
