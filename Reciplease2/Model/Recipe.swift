//
//  Recipe.swift
//  Reciplease2
//
//  Created by Pierre on 26/07/2022.
//

import Foundation

//// MARK: - Recipe
//struct Recipe: Codable {
//    let from, to, count: Int
//    let links: RecipeLinks
//    let hits: [Hit]
//
//    enum CodingKeys: String, CodingKey {
//        case from, to, count
//        case links = "_links"
//        case hits
//    }
//}
//
//// MARK: - Hit
//struct Hit: Codable {
//    let recipe: RecipeClass
//    let links: HitLinks
//
//    enum CodingKeys: String, CodingKey {
//        case recipe
//        case links = "_links"
//    }
//}
//
//// MARK: - HitLinks
//struct HitLinks: Codable {
//    let linksSelf: Next
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//    }
//}
//
//// MARK: - Next
//struct Next: Codable {
//    let href: String
//    let title: Title
//}
//
//enum Title: String, Codable {
//    case nextPage = "Next page"
//    case titleSelf = "Self"
//}
//
//// MARK: - RecipeClass
//struct RecipeClass: Codable {
//    let uri: String
//    let label: String
//    let image: String
//    let images: Images
//    let source: String
//    let url: String
//    let shareAs: String
//    let yield: Int
//    let dietLabels: [DietLabel]
//    let healthLabels, cautions, ingredientLines: [String]
//    let ingredients: [Ingredient]
//    let calories, totalWeight: Double
//    let totalTime: Int
//    let cuisineType: [CuisineType]
//    let mealType: [MealType]
//    let dishType: [String]
//    let totalNutrients, totalDaily: [String: Total]
//    let digest: [Digest]
//}
//
//enum CuisineType: String, Codable {
//    case american = "american"
//    case italian = "italian"
//    case mexican = "mexican"
//    case middleEastern = "middle eastern"
//}
//
//enum DietLabel: String, Codable {
//    case balanced = "Balanced"
//    case highFiber = "High-Fiber"
//    case lowCarb = "Low-Carb"
//}
//
//// MARK: - Digest
//struct Digest: Codable {
//    let label, tag: String
//    let schemaOrgTag: SchemaOrgTag?
//    let total: Double
//    let hasRDI: Bool
//    let daily: Double
//    let unit: Unit
//    let sub: [Digest]?
//}
//
//enum SchemaOrgTag: String, Codable {
//    case carbohydrateContent = "carbohydrateContent"
//    case cholesterolContent = "cholesterolContent"
//    case fatContent = "fatContent"
//    case fiberContent = "fiberContent"
//    case proteinContent = "proteinContent"
//    case saturatedFatContent = "saturatedFatContent"
//    case sodiumContent = "sodiumContent"
//    case sugarContent = "sugarContent"
//    case transFatContent = "transFatContent"
//}
//
//enum Unit: String, Codable {
//    case empty = "%"
//    case g = "g"
//    case kcal = "kcal"
//    case mg = "mg"
//    case µg = "µg"
//}
//
//// MARK: - Images
//struct Images: Codable {
//    let thumbnail, small, regular: Large
//    let large: Large?
//
//    enum CodingKeys: String, CodingKey {
//        case thumbnail = "THUMBNAIL"
//        case small = "SMALL"
//        case regular = "REGULAR"
//        case large = "LARGE"
//    }
//}
//
//// MARK: - Large
//struct Large: Codable {
//    let url: String
//    let width, height: Int
//}
//
//// MARK: - Ingredient
//struct Ingredient: Codable {
//    let text: String
//    let quantity: Double
//    let measure: String?
//    let food: String
//    let weight: Double
//    let foodCategory: String?
//    let foodID: String
//    let image: String?
//
//    enum CodingKeys: String, CodingKey {
//        case text, quantity, measure, food, weight, foodCategory
//        case foodID = "foodId"
//        case image
//    }
//}
//
//enum MealType: String, Codable {
//    case lunchDinner = "lunch/dinner"
//    case snack = "snack"
//}
//
//// MARK: - Total
//struct Total: Codable {
//    let label: String
//    let quantity: Double
//    let unit: Unit
//}
//
//// MARK: - RecipeLinks
//struct RecipeLinks: Codable {
//    let next: Next
//}





// MARK: - RecipesSearch

struct RecipesSearch: Decodable {
    let hits: [Hit]
}

// MARK: - Hit

struct Hit: Decodable {
    let recipe: Recipe
}

// MARK: - Recipe

struct Recipe: Decodable {
    let label: String
    let image: String?
    let url: String
    let yield: Int
    let ingredientLines: [String]
    let totalTime: Int?
}
