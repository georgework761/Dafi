//
//  HomeView.swift
//  CricketDafa
//
//  Created by D K on 22.03.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isDetShown = false
    
    var body: some View {
        ZStack {
            BGView()
            
            CustomNavBar(title: "Home")
            
            VStack {
                VStack {}
                    .frame(height: 100)
                
                Text("Welcome to Cricket Dafabe!")
                    .foregroundStyle(.white)
                    .font(.system(size: 32, weight: .black))
                    .multilineTextAlignment(.center)
                
                ChallangeView(text: "Last Man Standing!") {
                    isDetShown.toggle()
                }
                .padding(.top, 25)
                
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $isDetShown) {
            ChallangeDetailView()
        }
    }
}

#Preview {
    HomeView()
}
