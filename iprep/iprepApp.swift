//
//  iprepApp.swift
//  iprep
//
//  Created by Russell Miller on 9/20/25.
//

import SwiftUI

@main
struct iprepApp: App {
    @StateObject private var environment = AppEnvironment.shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(environment)
        }
    }
}
