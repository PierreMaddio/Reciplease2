//
//  ListRecipesViewController.swift
//  Reciplease2
//
//  Created by Pierre on 24/07/2022.
//

import UIKit
import Alamofire

class ListRecipesViewController: UIViewController {
    
    var recipes = [Recipe]()
    var ingredients: [String] = []
    
    @IBOutlet weak var tableRecipes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableRecipes.dataSource = self
        tableRecipes.delegate = self
        
        let service = RecipeService(url: ApiService.completeUrlRequest(ingredients: ingredients), httpClient: AlamofireClientRecipesSearch())
        
        service.getRecipes { result in
            switch result {
            case .success(let obj):
                self.recipes = obj.hits.map { $0.recipe }
                self.tableRecipes.reloadData()
            case .failure(let err):
                if case AFError.responseSerializationFailed(reason:) = err {

                } else {

                }
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
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//            // #warning Incomplete implementation, return the number of sections
//            return 1
//        }
//
//    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//            let middle = recipeSearch.listRecipe.count / 2
//            if indexPath.section == tableView.numberOfSections - 1 &&
//                indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - middle {
//                scroll(tableViewList)
//            }
//        }
//
//        override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//            self.lastContentOffset = scrollView.contentOffset.y
//        }
//
//        private func scroll(_ scrollView: UIScrollView) {
//            if (self.lastContentOffset < scrollView.contentOffset.y) {
//                if recipeSearch.listRecipe.count == 100 {
//                    return presentAlert(error: ErrorMessage.limitResult)
//                }
//                
//                recipeSearch.prepareForRequestInTableView()
//               
//                
//                recipeSearch.executeRequest(ingredient: self.recipeSearch.ingredientList)
//            }
//        }
}

