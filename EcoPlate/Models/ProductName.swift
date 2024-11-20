//
//  Untitled.swift
//  EcoPlate
//
//  Created by Juan Daniel Rodriguez Oropeza on 12.11.2024.
//

import Foundation

public struct ProductName: Codable, Identifiable, Observable,Hashable {
    public let id: Int
    public let name: String
}
