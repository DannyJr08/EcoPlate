import SwiftUI

public struct ProductsListView: View {
    @State private var showingRecipe = false
    @State private var selectedProducts: Set<Product> = []
    @State private var isSelecting = false
    @State private var searchQuery = ""  // State to hold search query
    
    let products: [Product]
    let title: String

    public var body: some View {
        NavigationView {
            VStack {
                List {
                    // Apply search filtering here
                    ForEach(filteredProducts, id: \.self) { product in
                        productRow(for: product)
                            .background(self.selectedProducts.contains(product) ? Color.blue.opacity(0.2) : Color.clear)
                            .onTapGesture {
                                if isSelecting {
                                    toggleSelection(for: product)
                                }
                            }
                            .onLongPressGesture {
                                isSelecting = true
                                toggleSelection(for: product)
                            }
                            .swipeActions { swipeActions(for: product) }
                            .contextMenu { contextMenu(for: product) }
                    }
                }
                .navigationTitle(title)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(isSelecting ? "Cancel" : "Select") {
                            isSelecting.toggle()
                            if !isSelecting {
                                selectedProducts.removeAll()
                            }
                        }
                    }
                    if !selectedProducts.isEmpty {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Recipe") {
                                showingRecipe = true
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchQuery)  // Adding the search bar here
            .sheet(isPresented: $showingRecipe) {
                RecipeView()
            }
        }
    }

    // MARK: - Subviews

    private func productRow(for product: Product) -> some View {
        HStack {
            productImage(for: product)
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                Text(product.shortName)
                    .font(.headline)
                Text(expirationText(for: product))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }

    // MARK: - Helpers
    
    private func productImage(for product: Product) -> some View {
        Group {
            if let image = UIImage(named: product.image) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(Color.purple.opacity(0.2))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text(String(product.shortName.prefix(1)))
                            .foregroundColor(.purple)
                            .font(.headline)
                    )
            }
        }
    }

    private func expirationText(for product: Product) -> String {
        let days = daysUntilExpiration(product)
        return days > 0 ? "\(days) days" : "Expired"
    }

    private func daysUntilExpiration(_ product: Product) -> Int {
        let calendar = Calendar.current
        return calendar.dateComponents([.day], from: Date(), to: product.expirationDate).day ?? 0
    }

    private func swipeActions(for product: Product) -> some View {
        Group {
            Button(role: .destructive) {
                // Handle deletion logic here
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }

    private func contextMenu(for product: Product) -> some View {
        Group {
            Button {
                selectedProducts = [product]
                showingRecipe = true
            } label: {
                Label("Recipe", systemImage: "book")
            }
            Button {
                // Handle edit action here
            } label: {
                Label("Edit", systemImage: "pencil")
            }
        }
    }

    private func toggleSelection(for product: Product) {
        if selectedProducts.contains(product) {
            selectedProducts.remove(product)
        } else {
            selectedProducts.insert(product)
        }
    }

    // MARK: - Computed Properties

    private var filteredProducts: [Product] {
        if searchQuery.isEmpty {
            return products
        } else {
            return products.filter { product in
                product.shortName.lowercased().contains(searchQuery.lowercased()) // Case-insensitive search
            }
        }
    }
}
