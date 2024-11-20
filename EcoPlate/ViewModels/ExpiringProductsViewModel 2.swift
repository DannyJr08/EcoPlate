//
//  ExpiredProductsViewModel.swift
//  EcoPlate
//
//  Created by kebato OS on 19/11/24.
//


import Foundation

public class ExpiringProductsViewModel: ObservableObject {
    
    init(){
        
    }
    
    public var products: [Product] {
        sampleProducts.filter { $0.expirationDate < Date() }
    }
}
