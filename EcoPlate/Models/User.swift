//
//  User.swift
//  EcoPlate
//
//  Created by Juan Daniel Rodriguez Oropeza on 12.11.2024.
//

import Foundation

public struct User: Codable {
    public let id: Int
    public var name: String
    public var email: String
    public var password: String
}
