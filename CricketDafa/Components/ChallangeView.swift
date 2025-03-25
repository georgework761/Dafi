//
//  ChallangeView.swift
//  CricketDafa
//
//  Created by D K on 22.03.2025.
//

import SwiftUI

struct ChallangeView: View {
    
    var text: String
    var completion: () -> ()
    
    var body: some View {
        Image("i2")
            .resizable()
            .scaledToFill()
            .frame(width: size().width - 70, height: 200)
            .cornerRadius(24)
            .scaleEffect(x: -1)
            .overlay {
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(LinearGradient(colors: [.darkRed, .lightRed], startPoint: .leading, endPoint: .trailing))
                        .opacity(0.55)
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(lineWidth: 4)
                        .fill(LinearGradient(colors: [.yellow, .yellow, .white, .yellow, .white, .yellow, .yellow], startPoint: .leading, endPoint: .trailing))
                    
                    VStack {
                        HStack {
                            Image("trophyIcon")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                            Text("Сhallenge of the day")
                                .foregroundStyle(.white)
                                .font(.system(size: 24))
                        }
                        .padding(.top)
                        
                        Text(text)
                            .foregroundStyle(.white)
                            
                            .padding(.horizontal)
                            .font(.system(size: 32, weight: .black))
                        
                        Spacer()
                    }
                }
            }
            .overlay {
                VStack {
                    Spacer()
                    
                    Button {
                        completion()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.lightRed)
                                .frame(width: 200, height: 60)
                            Text("Take part")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                    }
                    .offset(y: 20)
                }
            }
    }
}

#Preview {
    ChallangeView(text: "Some Text Some Text"){}
        .preferredColorScheme(.dark)
}
