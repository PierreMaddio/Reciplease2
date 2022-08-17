//
//  RecipleaseError.swift
//  Reciplease2
//
//  Created by Pierre on 17/08/2022.
//

import Foundation

enum RecipleaseError: Error {
case errorNetwork, errorIngredientneeded, errorNoResult
    
    
    var title: String {
        switch self {
        case .errorNetwork:
            return "Alert Network"
            // Search recipe Error messages
        case .errorIngredientneeded:
            return "Alert Ingredient"
        case .errorNoResult:
            return "Alert Result"
        }
    }
    
    // global  Error messages
    var message: String {
        switch self {
        case .errorNetwork:
            return "NetWork error"
        case .errorIngredientneeded:
            return "Need some ingredients"
        case .errorNoResult:
            return "No result, either the combination of ingredients gives nothing, or an ingredient is poorly written"
        }
    }
}
