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
    @State private var conditions: [String] = ["Good", "Bad"]
    
    private var options: [String] = ["Option 1", "Option 2", "Option 3"]
    
    @State private var selectedOption: String? = nil
    //@State private var customInput: String = ""
    //@State private var useCustomInput: Bool = false
    
    private var categories: [String] = ["Fruit", "Vegetable"]
    @State private var selectedCategory: String? = nil
    
    @State private var expirationDate: Date = Date()
    
    let capturedImage: UIImage
    
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
                                .foregroundStyle(option == "Good" ? Color.green : Color.red)
                                .tag(option as String?)
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    if let uiImage = UIImage(systemName: "photo") {
        ProductView(capturedImage: uiImage)
    } else {
        ProductView(capturedImage: UIImage()) // Provide a default UIImage as a fallback
    }
}
