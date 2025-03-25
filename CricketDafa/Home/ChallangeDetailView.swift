//
//  ChallangeDetailView.swift
//  CricketDafa
//
//  Created by D K on 25.03.2025.
//

import SwiftUI

struct ChallangeDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            BGView()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.darkRed)
                                .frame(width: 45, height: 45)
                            
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                                .bold()
                        }
                    }
                    .padding(.leading, 10)
                    
                    Spacer()
                    
                }
                .overlay {
                    Spacer()
                    
                    Text("Challange")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .black))
                }
                
                VStack {
                    Text("Last Man Standing")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .black))
                    
                    Text("🏏")
                        .font(.system(size: 92, weight: .black))
                        .padding(.top)
                }
                
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(LinearGradient(colors: [.darkRed, .lightRed], startPoint: .top, endPoint: .bottom))
                        .overlay {
                            ZStack {
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(lineWidth: 4)
                                    .fill(LinearGradient(colors: [.yellow, .yellow, .white, .yellow, .white, .yellow, .yellow], startPoint: .leading, endPoint: .trailing))
                            }
                        }
                }
                .padding(.top)
                
                ScrollView {
                    Text("Rules:")
                        .foregroundStyle(.white)
                        .font(.system(size: 26, weight: .bold, design: .monospaced))
                        .frame(width: size().width - 50, alignment: .leading)
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("1. Each player has only one life – if they get out, they are eliminated.")
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                            .padding(.top)
                        
                        Text("2. A player stays on the field until they are out or successfully hit 10 consecutive shots.")
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                        
                        Text("3. Mini-Challenges: Every 5 minutes, the conditions change:")
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                        
                        Text("""
•    “One Hand Only” – the bat can only be held with one hand.
•    “Reverse Shot” – the shot must be played with the non-dominant hand.
•    “Speed Mode” – the bowler delivers the ball every 10 seconds.
""")
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                        
                        Text("4. The last batter remaining is crowned the champion!")
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                            .padding(.bottom, 150)
                    }
                }
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    ChallangeDetailView()
}
