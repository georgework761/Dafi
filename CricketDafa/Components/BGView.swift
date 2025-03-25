//
//  BGView.swift
//  CricketDafa
//
//  Created by D K on 22.03.2025.
//

import SwiftUI

struct BGView: View {
    var body: some View {
       Rectangle()
            .fill(LinearGradient(colors: [.lightRed, .darkRed], startPoint: .top, endPoint: .bottom))
            .ignoresSafeArea()
    }
}

#Preview {
    BGView()
}
