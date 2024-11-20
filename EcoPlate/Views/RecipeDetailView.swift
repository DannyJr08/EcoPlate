import SwiftUI

struct RecipeDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedTab: Tab = .ingredients

    enum Tab {
        case ingredients, direction
    }

    var body: some View {
        VStack(spacing: 0) {
            // Navigation Bar
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.blue)
                }
                Spacer()
                Text("Face Mask")
                    .font(.headline)
                Spacer()
                Button(action: {
                    // Add favorite functionality
                }) {
                    Image(systemName: "heart")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            
            // Recipe Image with stretched fit
            ZStack {
                Image("Banana") // Replace with the actual image name
                    .resizable()
                    .scaledToFill() // Stretch image to fill the space
                    .frame(height: 200)
                    .clipped() // Ensure the image does not overflow
            }
            
            // Title Section
            Text("Banana Face Mask")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow.opacity(0.5))
            
            // Tab Selection
            HStack {
                Button(action: {
                    selectedTab = .ingredients
                }) {
                    Text("Ingredients")
                        .fontWeight(selectedTab == .ingredients ? .bold : .regular)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedTab == .ingredients ? Color.yellow.opacity(0.7) : Color.clear)
                        .cornerRadius(8)
                }

                Button(action: {
                    selectedTab = .direction
                }) {
                    Text("Direction")
                        .fontWeight(selectedTab == .direction ? .bold : .regular)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedTab == .direction ? Color.yellow.opacity(0.7) : Color.clear)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            .background(Color.yellow.opacity(0.2))
            
            // Dynamic Content
            ScrollView {
                ZStack {
                    Color(hex: "F9D146")
                        .edgesIgnoringSafeArea(.bottom) // Makes the blue background fill the screen vertically
                    
                    VStack(alignment: .leading, spacing: 10) {
                        // Conditionally display content based on the selected tab
                        if selectedTab == .ingredients {
                            Text("• 1 small ripe banana (preferably organic)")
                            Text("• 25g finely ground oatmeal")
                            Text("• 5ml runny honey")
                        } else {
                            Text("1. Mash the banana in a bowl.")
                            Text("2. Mix in the oatmeal and honey.")
                            Text("3. Apply to your face and leave for 10-15 minutes.")
                            Text("4. Rinse off with warm water.")
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading) // Ensures content is aligned top
            }
        }
        .navigationBarHidden(true) // Hide navigation bar
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    RecipeDetailView()
}
