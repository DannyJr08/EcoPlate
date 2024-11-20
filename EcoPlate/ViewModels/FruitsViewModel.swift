//
//  FruitsViewModel.swift
//  EcoPlate
//
//  Created by kebato OS on 20/11/24.
//
import Foundation

public class FruitsViewModel: ObservableObject {
    
    init(){
        
    }
    
    public var products: [Product] {
        sampleProducts.filter { $0.category == .fruits }
    }
}
