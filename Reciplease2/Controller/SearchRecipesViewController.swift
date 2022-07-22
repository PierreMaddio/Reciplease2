//
//  SearchRecipesViewController.swift
//  Reciplease2
//
//  Created by Pierre on 19/07/2022.
//
import UIKit
import CoreData

/*
 
 open a view controller under construction from first view controller which was presented by Main storyboard
 
 override func viewDidAppear(_ animated: Bool) {
     super.viewDidAppear(animated)
     let sb = UIStoryboard(name: "Main", bundle: nil)
     var vc = sb.instantiateViewController(withIdentifier: "favoriteVC")
     present(vc, animated: true)
 }
 
 */

class SearchRecipesViewController: UIViewController {
    
    
//    @IBOutlet var ingredientTextField: UITextField!
//    
//    
//    @IBOutlet var tableView: UITableView!
//    var items: [CDRecipe] = [] {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
//    func didTapSearch() {
//
//        let fetchRequest = NSFetchRequest<CDRecipe>.init(entityName: "CDRecipe")
//        fetchRequest.predicate = .init(format: "attr_ name LIKE %@", searchLabel.text!)
//        //let result = try? fetchRequest.execute()
//        let result = try! db.viewContext.fetch(fetchRequest)
//        items = result
//
//    }


}
