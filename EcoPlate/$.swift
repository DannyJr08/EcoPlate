//
//  $.swift
//  EcoPlate
//
//  Created by kebato OS on 19/11/24.
//

import Foundation


   public  let sampleProducts: [Product] = [
        Product(
            id: 1,
            name: ProductName(id: 1, name: "Apple"),
            category: .fruits,
            creationDate: Date(),
            expirationDate: Calendar.current.date(byAdding: .day, value: 3, to: Date())!,
            imageCondition: 0.8,
            currentCondition: 0.9,
            image: "apple"
        ),
        Product(
            id: 2,
            name: ProductName(id: 2, name: "Mango"),
            category: .fruits,
            creationDate: Date(),
            expirationDate: Calendar.current.date(byAdding: .day, value: 5, to: Date())!,
            imageCondition: 0.7,
            currentCondition: 0.8,
            image: "mango"
        ),
        Product(
            id: 3,
            name: ProductName(id: 3, name: "Potato"),
            category: .vegetables,
            creationDate: Date(),
            expirationDate: Calendar.current.date(byAdding: .day, value: 14, to: Date())!,
            imageCondition: 0.6,
            currentCondition: 0.7,
            image: "potato"
        ),
        Product(
            id: 4,
            name: ProductName(id: 4, name: "Tomato"),
            category: .vegetables,
            creationDate: Date(),
            expirationDate: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            imageCondition: 0.9,
            currentCondition: 0.8,
            image: "tomato"
        ),
        Product(
            id: 5,
            name: ProductName(id: 5, name: "Kiwi"),
            category: .fruits,
            creationDate: Date(),
            expirationDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
            imageCondition: 0.5,
            currentCondition: 0.4,
            image: "kiwi"
        )
    ]

