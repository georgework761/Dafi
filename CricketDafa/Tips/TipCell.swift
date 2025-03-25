//
//  TipCell.swift
//  CricketDafa
//
//  Created by D K on 25.03.2025.
//

import SwiftUI

struct TipCell: View {
    
    
    var tip: History
    
    @State private var isShown = false
    @Namespace var anima
    
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(LinearGradient(colors: [.darkRed, .lightRed], startPoint: .top, endPoint: .bottom))
            .frame(width: size().width - 80, height: size().height / 1.75)
            .overlay {
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(lineWidth: 4)
                        .fill(LinearGradient(colors: [.yellow, .yellow, .white, .yellow, .white, .yellow, .yellow], startPoint: .leading, endPoint: .trailing))
                    if !isShown {
                        VStack {
                            Image(tip.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: size().width - 85, height: 160)
                                .clipShape(.rect(topLeadingRadius: 24, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 24))
                                .overlay {
                                    UnevenRoundedRectangle(topLeadingRadius: 24, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 24)
                                        .fill(LinearGradient(colors: [.darkRed, .lightRed], startPoint: .top, endPoint: .bottom))
                                        .opacity(0.55)
                                }
                            
                            
                            Text(tip.title)
                                .foregroundStyle(.white)
                                .font(.system(size: 32, weight: .black))
                                .multilineTextAlignment(.center)
                                .padding(.top, 30)
                                .padding(.horizontal)
                                .matchedGeometryEffect(id: "title", in: anima)
                            
                            Spacer()
                        }
                    } else {
                        VStack {
                            Text(tip.title)
                                .foregroundStyle(.white)
                                .font(.system(size: 32, weight: .black))
                                .multilineTextAlignment(.center)
                                .padding(.top, 30)
                                .padding(.horizontal)
                                .matchedGeometryEffect(id: "title", in: anima)
                            
                            ScrollView {
                                Text(tip.about)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal)
                                    .padding(.bottom, 25)
                                    
                            }
                            .padding(.bottom, 45)
                            .scrollIndicators(.hidden)
                        }
                    }
                }
            }
            .overlay {
                VStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isShown.toggle()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.lightRed)
                                .frame(width: 200, height: 60)
                            Text(isShown ? "Close" : "Show")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                    }
                    .shadow(radius: 10)
                    .offset(y: 20)
                }
            }
    }
}

#Preview {
    TipCell(tip: DataManager.shared.tips.first!)
}
