//
//  MainTabsView.swift
//  CricketDafa
//
//  Created by D K on 21.03.2025.
//

import SwiftUI

#Preview {
    MainTabsView()
}

struct MainTabsView: View {
    
    @State private var selectedTab = "Home"
    
    @State private var isFirst = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                TabView(selection: $selectedTab) {
                    HomeView().tag("Home")
                    
                    TrainigsView().tag("Trainings")
                    
                    TipsView().tag("Advice")
                    
                    HistoryView().tag("History")
                    
                    AchView().tag("Achievements")
                }
                
                HStack(spacing: 0) {
                    Spacer(minLength: 0)
                    
                    TabButton(title: "Home", image: "homeIcon", selected: $selectedTab)
                    
                    Spacer(minLength: 0)
                    
                    TabButton(title: "Trainings", image: "trainingsIcon", selected: $selectedTab)
                    
                    Spacer(minLength: 0)
                    
                    TabButton(title: "History", image: "historyIcon", selected: $selectedTab)
                    
                    Spacer(minLength: 0)
                    
                    TabButton(title: "Advice", image: "adviceIcon", selected: $selectedTab)
                    
                    Spacer(minLength: 0)
                    
                    TabButton(title: "Achievements", image: "achevementsIcon", selected: $selectedTab)
                    
                    Spacer(minLength: 0)
                }
                .padding(.vertical, 10)
                .background {
                    UnevenRoundedRectangle(topLeadingRadius: 18, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 18)
                        .fill(LinearGradient(colors: [.darkRed, .lightRed], startPoint: .leading, endPoint: .trailing))
                        .overlay {
                            UnevenRoundedRectangle(topLeadingRadius: 18, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 18)
                                .stroke(lineWidth: 4)
                                .fill(LinearGradient(colors: [.yellow, .yellow, .white, .yellow, .white, .yellow, .yellow], startPoint: .leading, endPoint: .trailing))
                            
                        }
                    
                }
            }
        }
        .onAppear {
            if !UserDefaults.standard.bool(forKey: "onb") {
                isFirst.toggle()
                UserDefaults.standard.setValue(true, forKey: "onb")
            }
        }
        .fullScreenCover(isPresented: $isFirst) {
            OnboardingView()
        }
    }
}

struct TabButton: View {
    var title: String
    var image: String
    
    @Binding var selected: String
    
    var body: some View {
        Button {
            withAnimation(.smooth) {
                selected = title
            }
        } label: {
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                //  .colorInvert()
                    .colorMultiply(selected == title ? .customYellow : .white)
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                
                Text(title)
                    .foregroundStyle(.white)
                    .colorMultiply(selected == title ? .customYellow : .white)
                    .font(.system(size: 12))
            }
        }
    }
}
