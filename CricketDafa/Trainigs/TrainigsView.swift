//
//  TrainigsView.swift
//  CricketDafa
//
//  Created by D K on 22.03.2025.
//

import SwiftUI

struct TrainigsView: View {
    
    @State private var trainings: [Training] = []
    
    var body: some View {
        ZStack {
            BGView()
            
            CustomNavBar(title: "Trainings")
            
            VStack {
                VStack {}
                    .frame(height: 80)
                
                Text("Choose Training!")
                    .foregroundStyle(.white)
                    .font(.system(size: 32, weight: .black))
                    .multilineTextAlignment(.center)
                
           SliderView(data: trainings)
                
                
                Spacer()
            }
        }
        .onAppear {
            trainings = DataManager.shared.trainings
        }
    }
}

#Preview {
    TrainigsView()
}
