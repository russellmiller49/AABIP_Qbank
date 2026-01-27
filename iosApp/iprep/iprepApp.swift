//
//  iprepApp.swift
//  iprep
//
//  Created by Russell Miller on 9/20/25.
//

import SwiftUI

@main
struct iprepApp: App {
    @StateObject private var environment: AppEnvironment

    init() {
        print("[iprepApp] init starting...")
        _environment = StateObject(wrappedValue: AppEnvironment.shared)
        print("[iprepApp] init complete")
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(environment)
                .onAppear {
                    print("[iprepApp] RootView appeared")
                }
        }
    }
}
