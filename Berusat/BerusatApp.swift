//
//  BerusatApp.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import SwiftUI

@main
struct BerusatApp: App {
    @StateObject var userSettings = UserSettingsState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userSettings)
        }
    }
}
