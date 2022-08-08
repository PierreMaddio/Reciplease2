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
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
