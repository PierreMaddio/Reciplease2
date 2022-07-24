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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "ShowListRecipe", sender: nil)
    }
    
    
    
}
