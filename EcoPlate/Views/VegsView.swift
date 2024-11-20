//
//  ExpiredProductsView.swift
//  EcoPlate
//
//  Created by kebato OS on 19/11/24.
//


import SwiftUI

struct VegsView: View {
    @StateObject private var viewModel = VegsViewModel()

    var body: some View {
        ProductsListView(products: viewModel.products, title: "Vegetables")
    }
}
