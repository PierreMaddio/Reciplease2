//
//  RecipleaseError.swift
//  Reciplease2
//
//  Created by Pierre on 17/08/2022.
//

import Foundation

enum RecipleaseError: Error {
case errorNetwork, errorIngredientneeded, errorParsingJson
    
    var title: String {
        switch self {
        case .errorNetwork, .errorParsingJson:
            return "Alert Network"
            // Search recipe Error messages
        case .errorIngredientneeded:
            return "Alert Ingredient"
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
        }
    }
}

