import SwiftUI
import UIKit

struct ContentView: View {
    // State variables for dynamic counters
    @State private var allCount: Int = 5
    @State private var expiringCount: Int = 4
    @State private var recipeCount: Int = 1
    @State private var expiredCount: Int = 1
    
    // To manage showing the camera
    @State private var isCameraPresented: Bool = false
    @State private var isProductViewActive: Bool = false
    @State private var capturedImage: UIImage? = nil
    @State private var navigationPath = NavigationPath() // To manage navigation
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("Eco Plate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                // Quick Access Buttons
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        NavigationLink(destination: AllProductsView()){
                            QuickAccessButton(icon: "list.bullet", title: "All", count: allCount, color: .gray.opacity(0.1))
                        }
                        NavigationLink(destination: ExpiredProductsView()){
                            QuickAccessButton(icon: "clock", title: "Expiring", count: expiringCount, color: .pink.opacity(0.2))
                        }
                    }
                    
                    HStack(spacing: 16) {
                        QuickAccessButton(icon: "recipe_icon", title: "Recipe", count: recipeCount, color: .gray.opacity(0.1))
                        NavigationLink(destination: ExpiringProductsView()){
                            QuickAccessButton(icon: "trash", title: "Expired", count: recipeCount, color: .gray.opacity(0.1))
                        }
                    }
                }
                .padding(.horizontal)
                
                // Category Section
                Text("Category")
                    .font(.headline)
                    .padding(.horizontal)
                
                VStack(spacing: 10) {
                    NavigationLink(destination: VegsView()){
                        CategoryButton(title: "Vegetable", count: 2) // Example dynamic split
                    }
                  
                    NavigationLink(destination: FruitsView()){
                        CategoryButton(title: "Fruits", count: 3) // Example dynamic split
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Floating Camera Button at bottom center with larger size
                VStack {
                    Spacer()
                    Button(action: {
                        isCameraPresented.toggle() // Show the camera
                    }) {
                        HStack {
                            Image(systemName: "camera")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 80) // Larger size
                            
                        }
                        .padding(.leading, 170)

                    }
                    .padding(.bottom, 30) // Padding from the bottom edge
                    .sheet(isPresented: $isCameraPresented) {
                        CameraView(capturedImage: $capturedImage, onCapture: {
                            if let image = capturedImage {
                                    print("Captured image: \(image)") // Debug message
                                    navigationPath.append(image)     // Append to navigation path
                                } else {
                                    print("Captured image is nil.") // Debugging nil case
                                }
                        }, isProductViewActive: $isProductViewActive, allCount: $allCount, expiringCount: $expiringCount, recipeCount: $recipeCount, expiredCount: $expiredCount)
                    }
                }
            }
            .navigationDestination(for: UIImage.self) { image in
                            ProductView(capturedImage: image) // Show ProductView for captured image
                        }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

// Reusable Quick Access Button
struct QuickAccessButton: View {
    let icon: String
    let title: String
    let count: Int
    let color: Color

    var body: some View {
        VStack(spacing: 8) {
            if icon == "recipe_icon" {
                Image(icon) // Custom asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            } else {
                Image(systemName: icon) // SF Symbol
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text("\(count)")
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}

// Category Button
struct CategoryButton: View {
    let title: String
    let count: Int

    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
            Spacer()
            Text("\(count)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

// Camera View
struct CameraView: UIViewControllerRepresentable {
    @Binding var capturedImage: UIImage?
    var onCapture: (() -> Void)?
    
    @Binding var isProductViewActive: Bool
    
    // Bind counts to update after adding new products
    @Binding var allCount: Int
    @Binding var expiringCount: Int
    @Binding var recipeCount: Int
    @Binding var expiredCount: Int
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Coordinator to handle image picking
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraView

        init(_ parent: CameraView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // Example logic for updating counters
            parent.allCount += 1
            parent.expiringCount += 1 // Example increment
            parent.recipeCount += 1   // Example increment
            parent.expiredCount += 0  // Example (no increment)
            
            if let image = info[.originalImage] as? UIImage {
                parent.capturedImage = image
                print("Image picked: \(image).")
                parent.onCapture?() // Trigger navigation after capture
            } else {
                print("Failed to capture image.")
            }
            parent.isProductViewActive = true
            picker.dismiss(animated: true)
        }
    }
}

// Preview
#Preview {
    ContentView()
}
