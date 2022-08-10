//
//  DetailRecipeViewController.swift
//  Reciplease2
//
//  Created by Pierre on 24/07/2022.
//

import UIKit

class DetailRecipeViewController: UIViewController {
    
    @IBOutlet weak var titleRecipeLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var getDirectionButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
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
        yieldLabel.text = "\(recipe?.yield ?? 0)"
        timeLabel.text = "\(recipe?.totalTime ?? 0)"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailRecipeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipe?.ingredientLines.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        cell.textLabel?.text = recipe?.ingredientLines[indexPath.row] ?? ""
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = .white
        return cell
    }
    
    
}
