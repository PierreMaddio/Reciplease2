//
//  SearchRecipesViewController.swift
//  Reciplease2
//
//  Created by Pierre on 19/07/2022.
//
import UIKit
import CoreData

class SearchRecipesViewController: UIViewController {
    
    @IBOutlet weak var ingredientTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var allButtons: [UIButton]!
    @IBOutlet weak var tableView: UITableView!
    
    var ingredients: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "ShowListRecipes", sender: nil)
    }
    
    @IBAction func addIngredientAction(_ sender: Any) {
        if let ingredientText = ingredientTextField.text, !ingredientText.isEmpty {
            let tab = ingredientText.split(separator: ",")
            if tab.isEmpty {
                ingredients.append(ingredientText)
            } else {
                for item in tab {
                    ingredients.append(item.description.trimmingCharacters(in: .whitespaces))
                }
            }
            tableView.reloadData()
            ingredientTextField.text = ""
        }
    }
    
    @IBAction func clearIngredientAction(_ sender: Any) {
        ingredients.removeAll()
        tableView.reloadData()
    }
        
    // preparation of the parameters to be sent before launching segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowListRecipes" {
            if let destinationVc = segue.destination as? ListRecipesViewController {
                destinationVc.ingredients = self.ingredients
            }
        }
    }
}

extension SearchRecipesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIngredient", for: indexPath)
        cell.textLabel?.text = "- " + ingredients[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont (name: "Chalkduster", size: 18)
        return cell
    }
}
