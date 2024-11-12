//
//  Product.swift
//  EcoPlate
//
//  Created by Juan Daniel Rodriguez Oropeza on 12.11.2024.
//

import Foundation

public struct Product: Codable, Identifiable, Observable {
    public let id: Int
    public let name: ProductName
    public let category: ProductCategory
    public let creationDate: Date
    public let expirationDate: Date
    public var imageCondition: Double // From 0 to 1
    public var currentCondition: Double
    public let image: String
}
