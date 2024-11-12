//
//  ContentView.swift
//  EcoPlate
//
//  Created by Juan Daniel Rodriguez Oropeza on 08.11.2024.
//

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
