//
//  ApiService.swift
//  Reciplease2
//
//  Created by Pierre on 05/08/2022.
//

import Foundation

class ApiService {
    
    static let appKey = "c4ed16eb0795215c47de2959c93d00c4"
    static let appID = "7d167a47"
    
    private static let baseUrlApi: URL = URL(string: "https://api.edamam.com/api/")!
    
    //MARK: - Methods Endpoint 1 List of ingredients
    
    static func completeUrlRequest(ingredients: [String]) -> URL {
        let endpoint = URL(string: "recipes/v2/", relativeTo: baseUrlApi)!
        
        var newQueryItems = [URLQueryItem]()
        newQueryItems.append(.init(name: "app_key", value: appKey))
        newQueryItems.append(.init(name: "app_id", value: appID))
        newQueryItems.append(.init(name: "type", value: "any"))
        newQueryItems.append(.init(name: "q", value: ingredients.joined(separator: ",")))
        
        var urlCom = URLComponents.init(string: endpoint.absoluteString)!
        urlCom.queryItems = newQueryItems
        return urlCom.url!
    }
}
