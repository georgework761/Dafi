//
//  InitView.swift
//  CricketDafa
//
//  Created by D K on 27.03.2025.
//

import SwiftUI

struct InitView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some View {
        Group {
           MainTabsView()
        }
        .onAppear {
            AppDelegate.orientationLock = .portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
        }
    }
}

#Preview {
    InitView()
}
