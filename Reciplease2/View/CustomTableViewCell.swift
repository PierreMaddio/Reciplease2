//
//  CustomTableViewCell.swift
//  Reciplease2
//
//  Created by Pierre on 10/08/2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var recipeIngredientsLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(recipe: Recipe) {
        recipeLabel.text = recipe.label
        var strIngredient = ""
        recipe.ingredientLines.forEach { ingredient in
            strIngredient = strIngredient + " " + ingredient
        }
        recipeIngredientsLabel.text = strIngredient
        recipeImage.downloaded(from: recipe.image!)
    }
    
}
