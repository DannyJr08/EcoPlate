//
//  ExpiredProductsView.swift
//  EcoPlate
//
//  Created by kebato OS on 19/11/24.
//


import SwiftUI

struct ExpiredProductsView: View {
    @StateObject private var viewModel = ExpiredProductsViewModel()

    var body: some View {
        ProductsListView(products: viewModel.products, title: "Expired Products")
    }
}
