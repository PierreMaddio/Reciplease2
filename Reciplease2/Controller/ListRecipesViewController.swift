//
//  ListRecipesViewController.swift
//  Reciplease2
//
//  Created by Pierre on 24/07/2022.
//

import UIKit

class ListRecipesViewController: UIViewController {
    
    static var cellIdentifier = "RecipeCell"
    
    var recipes = [Recipe]()
    var ingredients: [String] = []
    
    @IBOutlet weak var tableRecipes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableRecipes.dataSource = self
        tableRecipes.delegate = self
        
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
    
}

extension ListRecipesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: ListRecipesViewController.cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: ListRecipesViewController.cellIdentifier)
        }
        let recipe = recipes[indexPath.row]
        cell?.textLabel?.text = recipe.label
        
        return cell!
    }
}
