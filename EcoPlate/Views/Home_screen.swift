/*import SwiftUI
import UIKit

struct DashboardView: View {
    // State variables for dynamic counters
    @State private var allCount: Int = 0
    @State private var expiringCount: Int = 0
    @State private var recipeCount: Int = 0
    @State private var expiredCount: Int = 0
    
    // To manage showing the camera
    @State private var isCameraPresented: Bool = false
    @State private var capturedImage: UIImage? = nil
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("Eco Plate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                // Quick Access Buttons
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        QuickAccessButton(icon: "list.bullet", title: "All", count: allCount, color: .gray.opacity(0.1))
                        QuickAccessButton(icon: "clock", title: "Expiring", count: expiringCount, color: .pink.opacity(0.2))
                    }
                    
                    HStack(spacing: 16) {
                        QuickAccessButton(icon: "recipe_icon", title: "Recipe", count: recipeCount, color: .gray.opacity(0.1))
                        QuickAccessButton(icon: "trash", title: "Expired", count: expiredCount, color: .gray.opacity(0.1))
                    }
                }
                .padding(.horizontal)
                
                // Category Section
                Text("Category")
                    .font(.headline)
                    .padding(.horizontal)
                
                VStack(spacing: 10) {
                    CategoryButton(title: "Vegetable", count: allCount / 2) // Example dynamic split
                    CategoryButton(title: "Fruits", count: allCount / 2) // Example dynamic split
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Floating Camera Button
                HStack {
                    Spacer()
                    Button(action: {
                        isCameraPresented.toggle() // Show the camera
                    }) {
                        HStack {
                            Image(systemName: "camera")
                                .foregroundColor(.black)
                            Text("Camera")
                                .foregroundColor(.black)
                        }
                        .padding(10)
                        .background(Capsule().stroke(Color.black, lineWidth: 1))
                    }
                    .padding()
                    .sheet(isPresented: $isCameraPresented) {
                        CameraView(capturedImage: $capturedImage, allCount: $allCount, expiringCount: $expiringCount, recipeCount: $recipeCount, expiredCount: $expiredCount)
                    }
                }
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
            }

            picker.dismiss(animated: true)
        }
    }
}

// Preview
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
 
*/

/*
 
 import SwiftUI

 struct ContentView: View {

     @State var email: String = ""
     @State var password: String = ""

     var body: some View {
         VStack {
             Text("")
                 .padding(.vertical, 80)

             VStack {
                 Text("Sign up")
                     .font(.custom("Arial", size: 30))
                     .fontWeight(.bold)
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .padding(.horizontal)

                 Form {
                     Section("Email") {
                         TextField("Your email", text: $email)
                             .textFieldStyle(.roundedBorder)
                     }

                     Section("Password") {
                         TextField("Enter your password", text: $password)
                             .textFieldStyle(.roundedBorder)
                     }

                     Button("Sign up") {
                         /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/
                         /*@END_MENU_TOKEN@*/
                     }
                     .padding()
                     .frame(maxWidth: .infinity)
                     .background(Color.black)
                     .foregroundStyle(Color.white)
                     .clipShape(.capsule)
                 }
                 .scrollContentBackground(.hidden)
                 .background(Color.white)
             }

             HStack {
                 Divider()
                     .frame(height: 1)
                     .background(Color.gray)

                 Text("Or Register with")
                     .foregroundColor(.gray)
                     .padding(.horizontal, 8)

                 Divider()
                     .frame(height: 1)
                     .background(Color.gray)
             }

             .padding()

             HStack {
                 
                 Button(action: {
                     // Your button action here
                 }) {
                     ZStack {
                         // Black border layer
                         Image(systemName: "applelogo")
                             .resizable()
                             .frame(width: 57, height: 57) // Slightly larger for the border effect
                             .foregroundColor(.black)
                             .offset(x: 1, y: 0)
                         
                         // White logo layer
                         Image(systemName: "applelogo")
                             .resizable()
                             .frame(width: 50, height: 50) // Original size for the logo
                             .foregroundColor(.white)
                     }
                     .padding()
                     .border(.black, width: 1)
                 }
                 .buttonStyle(PlainButtonStyle())
             }
         }
         .navigationTitle("Sign up")
     }
 }

 #Preview {
     ContentView()
 }

 */
