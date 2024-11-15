//
//  Product.swift
//  EcoPlate
//
//  Created by Juan Daniel Rodriguez Oropeza on 12.11.2024.
//

import SwiftUI


struct ProductView: View {
   @Environment(\.dismiss) var dismiss
    
    @State private var conditionValue: Double = 5
    
    private var options: [String] = ["Option 1", "Option 2", "Option 3"]
    
    @State private var selectedOption: String? = nil
    //@State private var customInput: String = ""
    //@State private var useCustomInput: Bool = false
    
    private var categories: [String] = ["Fruit", "Vegetable"]
    @State private var selectedCategory: String? = nil
    
    @State private var expirationDate: Date = Date()

    var body: some View {
        Form {
            Text("Image")
            
            HStack {
                Text("Condition")
                    .padding(.trailing)
                VStack {
                    Slider(value: $conditionValue, in: 0...10, step: 1.0)
                    Text("\(Int(conditionValue))")
                        .bold()
                        .italic()
                }
            }
            .padding()
            
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
            }
        }
    }
}

#Preview {
    ProductView()
}
