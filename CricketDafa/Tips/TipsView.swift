//
//  TipsView.swift
//  CricketDafa
//
//  Created by D K on 22.03.2025.
//

import SwiftUI

struct TipsView: View {
    
    @State var currentIndex: Int = 0
    @State var tipIndex: Int = 0
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150, maximum: 170))
    ]
    
    @State private var tips: [History] = []
    
    var body: some View {
        ZStack {
            BGView()
            
            CustomNavBar(title: "Advices")
            
            VStack {
                VStack {}
                    .frame(height: 80)
                
                Text("Usefull Tips!")
                    .foregroundStyle(.white)
                    .font(.system(size: 32, weight: .black))
                    .multilineTextAlignment(.center)
                
           
                ZStack {
                    ForEach(0..<tips.count, id: \.self) { index in
                        
                        TipCell(tip: tips[index])
                            .offset(x: CGFloat(index - currentIndex) * size().width / 1.2 )
                            .gesture(
                                DragGesture()
                                    .onEnded({ value in
                                        let threshold: CGFloat = 50
                                        if value.translation.width > threshold {
                                            withAnimation {
                                                currentIndex = max(0, currentIndex - 1)
                                                tipIndex = currentIndex
                                            }
                                        } else if value.translation.width < -threshold {
                                            withAnimation {
                                                currentIndex = min(tips.count - 1, currentIndex + 1)
                                                tipIndex = currentIndex
                                                
                                            }
                                        }
                                    })
                            )
                    }
                }
                
                Spacer()
            }
        }
        .onAppear {
            tips = DataManager.shared.tips
        }
    }
}

#Preview {
    TipsView()
}
