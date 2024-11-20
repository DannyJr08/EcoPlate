//
//  AllProductsView.swift
//  EcoPlate
//
//  Created by kebato OS on 19/11/24.
//
import SwiftUI

public struct AllProductsView: View {
    @StateObject private var viewModel = AllProductsViewModel()

    public var body: some View {
        ProductsListView(products: viewModel.products,
                         title: "All Products")
    }
}

#Preview {
    AllProductsView()
}
