//
//  SliderView.swift
//  CricketDafa
//
//  Created by D K on 24.03.2025.
//

import SwiftUI

struct SliderView: View {
    
    var data: [Training]
    
    @State var currentIndex: Int = 0
    @State var clubIndex: Int = 0
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150, maximum: 170))
    ]
    
    var body: some View {
        ZStack {
            ForEach(0..<data.count, id: \.self) { index in
                
                TrainingCell(training: data[index])
                    .offset(x: CGFloat(index - currentIndex) * size().width / 1.2 )
                    .gesture(
                        DragGesture()
                            .onEnded({ value in
                                let threshold: CGFloat = 50
                                if value.translation.width > threshold {
                                    withAnimation {
                                        currentIndex = max(0, currentIndex - 1)
                                        clubIndex = currentIndex
                                    }
                                } else if value.translation.width < -threshold {
                                    withAnimation {
                                        currentIndex = min(data.count - 1, currentIndex + 1)
                                        clubIndex = currentIndex
                                        
                                    }
                                }
                            })
                    )
            }
        }
   
    }
}

#Preview {
    SliderView(data:  DataManager.shared.trainings)
}
