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
    
    @IBAction func markAsFavorite(_ sender: Any) {
        let managedObjectContext = AppDelegate.sharedAppDelegate.persistentContainer.viewContext
        guard  let recipeEntity = NSEntityDescription.entity(forEntityName: "RecipleaseCoreData", in: managedObjectContext) else {
            print("Unable to get entity")
            return }
        let favoriteEntity = NSManagedObject(entity: recipeEntity, insertInto: managedObjectContext)
        favoriteEntity.setValue(recipe?.image ?? "", forKey: "image")
        favoriteEntity.setValue(recipe?.label ?? "", forKey: "label")
        favoriteEntity.setValue("\(recipe?.totalTime ?? 0)", forKey: "totalTime")
        favoriteEntity.setValue("\((recipe?.ingredientLines ?? [String]()).joined(separator: "$j%^"))", forKey: "ingredientLines")
        favoriteEntity.setValue(recipe?.url ?? "", forKey: "url")
        favoriteEntity.setValue("\(recipe?.yield ?? 0)", forKey: "yield")
        
        do {
            try managedObjectContext.save()
        } catch let error {
            print("Error saving entry == \(error.localizedDescription)")
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
