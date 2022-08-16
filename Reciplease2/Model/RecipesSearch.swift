//
//  RecipesSearch.swift
//  Reciplease2
//
//  Created by Pierre on 06/08/2022.
//

import Foundation

// MARK: - RecipesSearch
struct RecipesSearch: Decodable {
    let from, to, count: Int
    let links: RecipesSearchLinks
    let hits: [Hit]

    enum CodingKeys: String, CodingKey {
        case from, to, count
        case links = "_links"
        case hits
    }
}

// MARK: - Hit
struct Hit: Decodable {
    let recipe: Recipe
    let links: HitLinks

    enum CodingKeys: String, CodingKey {
        case recipe
        case links = "_links"
    }
}

// MARK: - HitLinks
struct HitLinks: Codable {
    let linksSelf: Next

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - Next
struct Next: Codable {
    let href: String
    let title: Title
}

enum Title: String, Codable {
    case nextPage = "Next page"
    case titleSelf = "Self"
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

// MARK: - RecipesSearchLinks
struct RecipesSearchLinks: Codable {
    let next: Next
}

//// MARK: - RecipesSearch
//
//struct RecipesSearch: Decodable {
//    let hits: [Hit]
//}
//
//// MARK: - Hit
//
//struct Hit: Decodable {
//    let recipe: Recipe
//}
//
//// MARK: - Recipe
//
//struct Recipe: Decodable {
//    let label: String
//    let image: String?
//    let url: String
//    let yield: Int
//    let ingredientLines: [String]
//    let totalTime: Int?
//}
