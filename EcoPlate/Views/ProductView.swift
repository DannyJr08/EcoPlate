//
//  Product.swift
//  EcoPlate
//
//  Created by Juan Daniel Rodriguez Oropeza on 12.11.2024.
//

import SwiftUI


struct ProductView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var conditionValue: String? = nil
    @State private var conditions: [String] = ["Good ✅", "Not Sure ⚠️", "Bad ❌"]
    
    private var options: [String] = ["Option 1", "Option 2", "Option 3"]
    
    @State private var selectedOption: String? = nil
    //@State private var customInput: String = ""
    //@State private var useCustomInput: Bool = false
    
    private var categories: [String] = ["Fruit", "Vegetable"]
    @State private var selectedCategory: String? = nil
    
    @State private var expirationDate: Date = Date()
    
    let capturedImage: UIImage
    
    // AppStorage keys for saving model data
    @AppStorage("savedProduct") private var savedProductData: String = ""
    
    // Explicit initializer
    init(capturedImage: UIImage) {
        self.capturedImage = capturedImage
    }
    
    var body: some View {
        Form {
            Image(uiImage: capturedImage)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack(alignment: .leading) {
                Section {
                    //HStack {
                    //VStack(alignment: .leading) {
                    /*if useCustomInput {
                     Text("Name")
                     .bold()
                     }
                     
                     HStack {
                     Text("Custom Name")
                     .font(.caption)
                     
                     Toggle("", isOn: $useCustomInput)
                     .labelsHidden()
                     }*/
                    //}
                    
                    
                    /*if !useCustomInput {
                     Picker("Name", selection: $selectedOption) {
                     ForEach(options, id: \.self) { option in
                     Text(option).tag(option as String?)
                     }
                     }
                     .pickerStyle(MenuPickerStyle())
                     }
                     
                     if useCustomInput {
                     TextField("Enter custom name", text: $customInput)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     }*/
                    //}
                    
                    Picker("Name", selection: $selectedOption) {
                        ForEach(options, id: \.self) { option in
                            Text(option).tag(option as String?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                
                Section {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { option in
                            Text(option).tag(option as String?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal)
                }
                
                Section {
                    HStack {
                        Text("Expiration Date")
                        DatePicker("", selection: $expirationDate, displayedComponents: .date)
                            .datePickerStyle(.automatic)
                            .padding()
                    }
                    .padding(.horizontal)
                }
                
                Section {
                    Picker("Condition", selection: $conditionValue) {
                        ForEach(conditions, id: \.self) { option in
                            Text(option)
                                .foregroundStyle(colorForCondition(option))
                                .tag(option as String?)
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Add Product")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: cancel) {
                    Text("Cancel")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: submitForm) {
                    Text("Submit")
                        .bold()
                }
            }
        }
    }
    
    private func colorForCondition(_ condition: String) -> Color {
        switch condition {
        case "Good ✅":
            return .green
        case "Not Sure ⚠️":
            return .yellow
        case "Bad ❌":
            return .red
        default:
            return .primary
        }
    }
    
    private func cancel() {
        dismiss()
    }
    
    private func submitForm() {
        // Create a Product instance
        let product = Product(
            id: Int.random(in: 1...1000), // Example ID generation
            name: ProductName(id: Int.random(in: 1...1000), name: selectedOption ?? "Unnamed Product"),
            category: selectedCategory == "Fruit" ? .fruits : .vegetables,
            creationDate: Date(),
            expirationDate: expirationDate,
            imageCondition: 0.5, // Example value
            currentCondition: conditionToValue(conditionValue),
            image: "placeholder" // Replace with actual image handling
        )
        
        // Save product as JSON string in AppStorage
        if let encodedProduct = encodeProduct(product) {
            savedProductData = encodedProduct
        }
        
        print("Form Submitted and Saved!")
        dismiss()
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    private func conditionToValue(_ condition: String?) -> Double {
        switch condition {
        case "Good ✅":
            return 1.0
        case "Not Sure ⚠️":
            return 0.5
        case "Bad ❌":
            return 0.0
        default:
            return 0.0
        }
    }
    
    private func encodeProduct(_ product: Product) -> String? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        guard let data = try? encoder.encode(product) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

#Preview {
    if let uiImage = UIImage(systemName: "photo") {
        ProductView(capturedImage: uiImage)
    } else {
        ProductView(capturedImage: UIImage()) // Provide a default UIImage as a fallback
    }
}
