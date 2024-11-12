//
//  Home.swift
//  EcoPlate
//
//  Created by Juan Daniel Rodriguez Oropeza on 12.11.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var showSheet = false
    
    var body: some View {
           Button("Present") {
               showSheet.toggle()
           }.font(.largeTitle)
           .sheet(isPresented: $showSheet) {
               ProductView()
           }
        }
}


#Preview {
    HomeView()
}
