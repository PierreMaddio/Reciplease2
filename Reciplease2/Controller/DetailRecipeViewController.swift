//
//  DetailRecipeViewController.swift
//  Reciplease2
//
//  Created by Pierre on 24/07/2022.
//

import UIKit
import CoreData

class DetailRecipeViewController: UIViewController {
    
    @IBOutlet weak var titleRecipeLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var getDirectionButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var infoRecipeView: UIView!
    @IBOutlet weak var yieldLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleRecipeLabel.isAccessibilityElement = true
        titleRecipeLabel.accessibilityHint = "The title of the recipe"
        
        tableView.delegate = self
        tableView.dataSource = self
        if let imageUrl = recipe?.image {
            recipeImageView.downloaded(from: imageUrl)
        } else {
            recipeImageView.image = UIImage(named: "recipe")
        }
        titleRecipeLabel.text = recipe?.label
        yieldLabel.text = "\(recipe?.yield ?? 0) p"
        timeLabel.text = "\(recipe?.totalTime ?? 0) m"
        
        infoRecipeView.layer.cornerRadius = 10
        infoRecipeView.layer.borderWidth = 1
        infoRecipeView.layer.borderColor = UIColor.white.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let isRecipeFavorite = self.checkIfFavorite()
        self.favoriteButton.tintColor = .white
        if isRecipeFavorite {
            self.favoriteButton.tintColor = .green
        }
    }
    
    @IBAction func markAsFavorite(_ sender: Any) {
        // If a recipe is already in favorite (with func checkIfFavorite), I delete it, otherwise I add it by changing the appearance of the star.
        
        guard let recipe = recipe else { return }
        let isFavorite = ManageCoreData.shared.checkIfFavorite(recipeName: recipe.label)
        if isFavorite {
            ManageCoreData.shared.deleteFromFavorite(recipeName: recipe.label) { [weak self] deleted in
                self?.favoriteButton.tintColor = .white
            }
        } else {
            ManageCoreData.shared.addAsFavorite(recipe: recipe) { [weak self] isFavorite in
                self?.favoriteButton.tintColor = .green
            }
        }
    }
    
    func checkIfFavorite() -> Bool {
        guard let recipeName = self.recipe?.label else { return false }
        return ManageCoreData.shared.checkIfFavorite(recipeName: recipeName)
    }
    
    func deleteFromFavorite() {
        guard let recipeName = self.recipe?.label else {return }
        ManageCoreData.shared.deleteFromFavorite(recipeName: recipeName) { success in
        }
    }
    
    @IBAction func getDirectionButtonAction(_ sender: Any) {
        buttonIsClicked()
    }
    
    // leave the app and launch safari with the link to the recipe page
    func open(scheme: String) {
        if let url = URL(string: scheme) {
            UIApplication.shared.open(url)
        }
    }
    
    func buttonIsClicked() {
        open(scheme: recipe?.url ?? "")
    }
    
}

extension DetailRecipeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipe?.ingredientLines.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        cell.textLabel?.text = "- " + (recipe?.ingredientLines[indexPath.row] ?? "")
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont (name: "Chalkduster", size: 18)
        return cell
    }
}
