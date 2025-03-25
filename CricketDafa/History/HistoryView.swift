//
//  HistoryView.swift
//  CricketDafa
//
//  Created by D K on 22.03.2025.
//

import SwiftUI

struct HistoryView: View {
    
    @State private var histories: [History] = []
    @State private var itemToShow: History?
    
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    
    var body: some View {
        ZStack {
            BGView()
            
            CustomNavBar(title: "History")
            
            VStack {
                VStack {}
                    .frame(height: 80)
                
                Text("History of Cricket")
                    .foregroundStyle(.white)
                    .font(.system(size: 32, weight: .black))
                    .multilineTextAlignment(.center)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(histories, id: \.id) { item in
                            Button {
                                itemToShow = item
                            } label: {
                                Image(item.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 200)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 18)
                                            .fill(LinearGradient(colors: [.darkRed, .lightRed], startPoint: .top, endPoint: .bottom))
                                            .opacity(0.55)
                                    }
                                    .cornerRadius(18)
                                    .shadow(radius: 10)
                                    .overlay {
                                        Text(item.title)
                                            .foregroundStyle(.white)
                                            .multilineTextAlignment(.center)
                                            .bold()
                                    }
                            }
                        }
                    }
                    .padding()
                    .padding(.bottom, 150)
                }
                .scrollIndicators(.hidden)
                
                Spacer()
            }
        }
        .sheet(item: $itemToShow) { item in
            HistoryDetailView(item: item)
                .presentationDetents([.height(300), .height(500)])
        }
        .onAppear {
            histories = DataManager.shared.histories
        }
    }
}

#Preview {
    HistoryView()
}
