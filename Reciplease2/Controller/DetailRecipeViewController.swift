//
//  DetailRecipeViewController.swift
//  Reciplease2
//
//  Created by Pierre on 24/07/2022.
//

import UIKit
import SafariServices

class DetailRecipeViewController: UIViewController {
    
    @IBOutlet weak var titleRecipeLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var getDirectionButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var infoRecipeView: UIView!
    @IBOutlet weak var yieldLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
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
    
    @IBAction func getDirectionButtonAction(_ sender: Any) {
        buttonIsClicked()
    }
    
    
    private func directionSafari(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    func buttonIsClicked() {
        directionSafari(for: recipe?.url ?? "")
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
