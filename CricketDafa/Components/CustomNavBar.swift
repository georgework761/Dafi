//
//  CustomNavBar.swift
//  CricketDafa
//
//  Created by D K on 22.03.2025.
//

import SwiftUI

struct CustomNavBar: View {
    
    @State private var isSettingsShown = false
    
    var title: String
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: size().width, height: 100)
                .foregroundStyle(.darkRed)
                .overlay {
                    Rectangle()
                        .stroke(lineWidth: 4)
                        .fill(LinearGradient(colors: [.yellow, .yellow, .white, .yellow, .white, .yellow, .yellow], startPoint: .leading, endPoint: .trailing))
                        .padding(.vertical, -10)
                        .offset(y: -10)
                }
                .overlay {
                    HStack {
                        Button {
                            
                        } label: {
//                            Circle()
//                                .frame(height: 35)
//                                .foregroundStyle(.lightRed)
//                                .overlay {
//                                    Image(systemName: "bell.fill")
//                                        .foregroundStyle(.white)
//                                }
                        }
                        .frame(width: 35)
                        
                        Spacer()
                        
                        Text(title)
                            .foregroundStyle(.white)
                            .font(.system(size: 28, weight: .bold))
                        
                        Spacer()
                        
                        Button {
                            isSettingsShown.toggle()
                        } label: {
                            Circle()
                                .frame(height: 35)
                                .foregroundStyle(.lightRed)
                                .overlay {
                                    Image(systemName: "gearshape.fill")
                                        .foregroundStyle(.white)
                                }
                        }
                    }
                    .padding(.horizontal)
                }
            
            Spacer()
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $isSettingsShown) {
            SettingsView()
        }
    }
}

#Preview {
    CustomNavBar(title: "Home")
        .preferredColorScheme(.dark)
}
