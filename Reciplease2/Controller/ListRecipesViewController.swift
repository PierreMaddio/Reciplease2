//
//  ListRecipesViewController.swift
//  Reciplease2
//
//  Created by Pierre on 24/07/2022.
//

import UIKit
import Alamofire
//import PaginatedTableView

class ListRecipesViewController: UIViewController {
    
    var recipes = [Recipe]()
    var ingredients: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    //@IBOutlet weak var tableView: PaginatedTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let service = RecipeService(url: ApiService.completeUrlRequest(ingredients: ingredients), httpClient: AlamofireClientRecipesSearch())
        
        service.getRecipes { result in
            switch result {
            case .success(let obj):
                self.recipes = obj.hits.map { $0.recipe }
                self.tableView.reloadData()
            case .failure(_):
                break
            }
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowDetailRecipe" {
//            if let destinationVc = segue.destination as? DetailRecipeViewController {
//                destinationVc.recipes = self.recipes
//            }
//        }
//    }
}

extension ListRecipesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let recipe = recipes[indexPath.row]
        cell.configure(recipe: recipe)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "detailRecipe") as? DetailRecipeViewController {
            vc.recipe = recipes[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

