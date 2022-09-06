//
//  BerusatApp.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import RevenueCat
import SwiftUI

@main
struct BerusatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelgate
    @StateObject var appState = AppState()
    @StateObject var userSettings = UserSettingsState()
    @StateObject var packageState = PackageState()

    init() {
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: K.revenueCatAPIKey)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .environmentObject(userSettings)
                .environmentObject(packageState)
        }
    }
}
