//
//  RecipeView.swift
//  EcoPlate
//
//  Created by Juan Daniel Rodriguez Oropeza on 19.11.2024.
//

import SwiftUI

struct RecipeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    RecipeCardView(
                        image: "Banana",
                        title: "Banana face mask"
                    )
                    RecipeCardView(
                        image: "Apple",
                        title: "Apple Pie"
                    )
                    RecipeCardView(
                        image: "Potato",
                        title: "Potato Scrub"
                    )
                    RecipeCardView(
                        image: "Strawberry",
                        title: "Strawberry Scrub"
                    )
                }
                .padding()
            }
            .navigationTitle("Recipe")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Edit") {
                        // Edit action
                    }
                }
            }
        }
    }
}

struct RecipeCardView: View {
    let image: String
    let title: String
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottom) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(15)
                    .clipped()
                
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(5)
                    
                    Spacer()
                    
                    Button(action: {
                        // Favorite action
                    }) {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                }
                .padding()
            }
            .frame(height: 200)
            .cornerRadius(15)
            .shadow(radius: 5)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
