//
//  ListRecipesViewController.swift
//  Reciplease2
//
//  Created by Pierre on 24/07/2022.
//

import UIKit
import Alamofire

class ListRecipesViewController: UIViewController {
    
    var recipes = [Recipe]()
    var ingredients: [String] = []
    var href: String = ""
    let service = RecipeService(httpClient: AlamofireClientRecipesSearch())
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchData()
    }
    
    func fetchData() {
        let url = ApiService.completeUrlRequest(ingredients: ingredients)
        
        service.getRecipes(url: url) { result in
            switch result {
            case .success(let obj):
                self.href = obj.links.next.href
                self.recipes = obj.hits.map { $0.recipe }
                self.tableView.reloadData()
            case .failure(_):
                if !self.ingredients.isEmpty {
                    self.alertNoResult()
                }
            }
        }
    }
    
    func alertNetwork() {
        let title = RecipleaseError.errorNetwork.title
        let message = RecipleaseError.errorNetwork.message
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true) {
                return
            }
    }
    
    func alertNoResult() {
        let title = RecipleaseError.errorNoResult.title
        let message = RecipleaseError.errorNoResult.message
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true) {
                return
            }
    }
}

extension ListRecipesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let recipe = recipes[indexPath.row]
        cell.configure(recipe: recipe)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "detailRecipe") as? DetailRecipeViewController {
            vc.recipe = recipes[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // pagination
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == recipes.count - 1 {
            
            self.tableView.tableFooterView = createSpinnerFooter()
            
            let url = URL(string: href)
            service.getRecipes(url: url!) { result in
                self.tableView.tableFooterView = nil
                switch result {
                case .success(let obj):
                    self.href = obj.links.next.href
                    self.recipes += obj.hits.map { $0.recipe }
                    self.tableView.reloadData()
                case .failure(_):
                    self.alertNetwork()
                }
            }
        }
    }
    
    @objc func loadTable() {
        self.tableView.reloadData()
    }
    
    private func createSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        
        let spinner = UIActivityIndicatorView()
        spinner.color = .white
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        
        return footerView
    }
}

