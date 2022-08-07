//
//  CustomTableViewCell.swift
//  Reciplease2
//
//  Created by Pierre on 07/08/2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(label: String, image: String) {
        recipeLabel.text = label
        recipeImage.image = UIImage(named: image)
    }
    
    

}
