//
//  ExpiredProductsView.swift
//  EcoPlate
//
//  Created by kebato OS on 19/11/24.
//


import SwiftUI

struct FruitsView: View {
    @StateObject private var viewModel = FruitsViewModel()

    var body: some View {
        ProductsListView(products: viewModel.products, title: "Fruits")
    }
}
