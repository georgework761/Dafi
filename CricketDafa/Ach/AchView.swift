//
//  AchView.swift
//  CricketDafa
//
//  Created by D K on 22.03.2025.
//

import SwiftUI

struct AchView: View {
    
    @State private var achievements: [History] = []
    
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    
    
    var body: some View {
        ZStack {
            BGView()
            
            CustomNavBar(title: "Achievements")
            
            VStack {
                VStack {}
                    .frame(height: 80)
                
                Text("Your Achievements")
                    .foregroundStyle(.white)
                    .font(.system(size: 32, weight: .black))
                    .multilineTextAlignment(.center)
                
           
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(achievements, id: \.id) { item in
                            RoundedRectangle(cornerRadius: 24)
                                .fill(LinearGradient(colors: [.black, .black, .lightRed], startPoint: .top, endPoint: .bottom))
                                .frame(width: 110, height: 140)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(lineWidth: 3)
                                        .fill(LinearGradient(colors: [.yellow, .yellow, .white, .yellow, .white, .yellow, .yellow], startPoint: .leading, endPoint: .trailing))
                                }
                                .overlay {
                                    VStack {
                                        Text(item.title)
                                            .foregroundStyle(.white)
                                            .multilineTextAlignment(.center)
                                            .font(.system(size: 14))
                                        
                                        Image(item.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 65, height: 50)
                                            .saturation(0.0)
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 150)
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
        }
        .onAppear {
            achievements = DataManager.shared.achievements
        }
    }
}

#Preview {
    AchView()
}
