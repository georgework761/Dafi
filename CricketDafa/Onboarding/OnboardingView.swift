//
//  OnboardingView.swift
//  CricketDafa
//
//  Created by D K on 21.03.2025.
//

import SwiftUI

extension View {
    func size() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
}

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .ignoresSafeArea()
            
            VStack {
                Image("i1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: size().width, height: 300)
                    .overlay {
                        ZStack {
                            Rectangle()
                                .fill(LinearGradient(colors: [.lightRed, .darkRed], startPoint: .top, endPoint: .bottom))
                                .opacity(0.5)
                        }
                    }
                
                Spacer()
            }
            
            VStack {
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 120, height: 120)
                            .foregroundStyle(.white)
                            .opacity(0.9)
                        
                        Image("logoIcon")
                            .resizable()
                            .frame(width: 90, height: 90)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                Rectangle()
                    .fill(LinearGradient(colors: [.lightRed, .darkRed], startPoint: .leading, endPoint: .trailing))
                    .frame(height: size().height / 1.5)
                    .clipShape(.rect(topLeadingRadius: 18, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 18))
                    .overlay {
                        UnevenRoundedRectangle(topLeadingRadius: 18, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 18)
                            .stroke(lineWidth: 4)
                            .foregroundStyle(.customYellow)
                        
                        
                    }
                    .overlay {
                        VStack {
                            Text("Welcome to Cricket Dafabe!")
                                .foregroundStyle(.white)
                                .font(.system(size: 32, weight: .black))
                                .multilineTextAlignment(.center)
                            
                            Text("Welcome to our app, where you can immerse yourself in the thrilling world of cricket! Our app is designed to make your cricket experience even more vibrant and engaging!")
                                .foregroundStyle(.white)
                                .font(.system(size: 24, weight: .regular))
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            Button {
                                dismiss()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 200, height: 60)
                                        .cornerRadius(12)
                                        .foregroundStyle(.yellow)
                                    
                                    Text("Get Started")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 24, weight: .black))
                                }
                            }
                        }
                    }
                    .offset(y: 10)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
