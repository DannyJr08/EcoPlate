//
//  Recipe.swift
//  EcoPlate
//
//  Created by Juan Daniel Rodriguez Oropeza on 12.11.2024.
//

import Foundation

public struct Recipe: Codable, Identifiable {
    public let id: Int
    public let name: String
    public let description: String
    public let productIngredients: [Product]
    public let commonIngredients: [String]
    public let instructions: String
    public var isFavorite: Bool
}
