//
//  TrainingCell.swift
//  CricketDafa
//
//  Created by D K on 22.03.2025.
//

import SwiftUI

struct TrainingCell: View {
    
    var training: Training
    
    @State private var isDetailShown = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(LinearGradient(colors: [.darkRed, .lightRed], startPoint: .top, endPoint: .bottom))
            .frame(width: size().width - 80, height: size().height / 1.75)
            .overlay {
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(lineWidth: 4)
                        .fill(LinearGradient(colors: [.yellow, .yellow, .white, .yellow, .white, .yellow, .yellow], startPoint: .leading, endPoint: .trailing))
                    
                    VStack {
                        Text(training.title)
                            .foregroundStyle(.white)
                            .font(.system(size: 32, weight: .black))
                            .multilineTextAlignment(.center)
                            .padding(.top, 30)
                        
                        Text(training.shortDescription)
                            .foregroundStyle(.white)
                            .padding()
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                }
            }
            .overlay {
                VStack {
                    Spacer()
                    
                    Button {
                        isDetailShown.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.lightRed)
                                .frame(width: 200, height: 60)
                            Text("Start")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                    }
                    .shadow(radius: 10)
                    .offset(y: 20)
                }
            }
            .fullScreenCover(isPresented: $isDetailShown) {
                TrainigsDetailView(training: training)
            }
    }
}

#Preview {
    TrainingCell(training: Training(title: "Batting Off the Bounce", shortDescription: "Players practice hitting the ball after it bounces off the ground.  This exercise improves batting accuracy, control, and reaction time.", longDescription: "This drill focuses on improving a player's ability to hit the ball accurately after it bounces off the pitch. Players stand at the crease while a coach or teammate throws the ball to simulate a bowler's delivery. The goal is to make solid contact with the ball, directing it to specific areas of the field. This exercise enhances hand-eye coordination, timing, and the ability to adjust to different bounce heights and speeds. It's particularly useful for practicing defensive shots and driving the ball along the ground.", image: ""))
        .preferredColorScheme(.dark)
}
