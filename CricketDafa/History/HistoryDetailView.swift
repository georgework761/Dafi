//
//  HistoryDetailView.swift
//  CricketDafa
//
//  Created by D K on 25.03.2025.
//

import SwiftUI

struct HistoryDetailView: View {
    
    var item: History
    
    var body: some View {
        ZStack {
            BGView()
            
            ScrollView {
                VStack {
                    Text(item.title)
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .black))
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                        .padding(.horizontal)
                    
                    Text(item.about)
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .padding(.horizontal)
                        .padding(.top)
                        .padding(.bottom, 150)
                    
                    Spacer()
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HistoryDetailView(item: DataManager.shared.histories.first!)
}
