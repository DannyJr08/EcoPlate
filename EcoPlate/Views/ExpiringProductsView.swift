//
//  ExpiredProductsView.swift
//  EcoPlate
//
//  Created by kebato OS on 19/11/24.
//


import SwiftUI

struct ExpiringProductsView: View {
    @StateObject private var viewModel = ExpiringProductsViewModel()

    var body: some View {
        ProductsListView(products: viewModel.products, title: "Expired Products")
    }
}
