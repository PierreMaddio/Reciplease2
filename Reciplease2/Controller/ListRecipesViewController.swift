//
//  ListRecipesViewController.swift
//  Reciplease2
//
//  Created by Pierre on 24/07/2022.
//

import UIKit
import Alamofire
import PaginatedTableView

class ListRecipesViewController: UIViewController {
    
    var recipes = [Recipe]()
    var ingredients: [String] = []
    var href: String = ""
    let service = RecipeService(httpClient: AlamofireClientRecipesSearch())
    
    @IBOutlet weak var tableView: UITableView!
    //@IBOutlet weak var paginatedTableView: PaginatedTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchData()
        
    }
    
    func fetchData() {
        let url = ApiService.completeUrlRequest(ingredients: ingredients)
        
        service.getRecipes(url: url) { result in
            switch result {
            case .success(let obj):
                self.href = obj.links.next.href
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
    
    // pagination
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == recipes.count - 1 {
            let url = URL(string: href)
            service.getRecipes(url: url!) { result in
                switch result {
                case .success(let obj):
                    self.href = obj.links.next.href
                    self.recipes += obj.hits.map { $0.recipe }
                    self.tableView.reloadData()
                case .failure(_):
                    break
                }
            }
        }
    }
    
    @objc func loadTable() {
        self.tableView.reloadData()
    }
    
}

