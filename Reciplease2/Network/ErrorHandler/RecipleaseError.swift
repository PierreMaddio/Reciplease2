//
//  RecipleaseError.swift
//  Reciplease2
//
//  Created by Pierre on 17/08/2022.
//

import Foundation

enum RecipleaseError: Error {
    case errorNetwork, errorIngredientneeded, errorParsingJson, errorInfoAddFavorite, errorNoResult
    
    var title: String {
        switch self {
        case .errorNetwork, .errorParsingJson:
            return "Alert Network"
        case .errorIngredientneeded:
            return "Alert Ingredient"
        case .errorInfoAddFavorite:
            return "Alert Favorite"
        case .errorNoResult:
            return "Alert Result"
        }
    }
    
    var message: String {
        switch self {
        case .errorNetwork:
            return "NetWork error"
        case .errorParsingJson:
            return "No parsing Json"
        case .errorIngredientneeded:
            return "Need some ingredients"
        case .errorInfoAddFavorite:
            return "To add recipes to favorites click on the white star on the recipe page"
        case .errorNoResult:
            return "No result, either the combination of ingredients returns nothing, or an ingredient is misspelled"
        }
    }
}

