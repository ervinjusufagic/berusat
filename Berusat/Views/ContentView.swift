//
//  ContentView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import SwiftUI

struct ContentView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelgate

    var body: some View {
        NavigationView {
            ZStack {
                Color(AppColor.darkColor)
                    .edgesIgnoringSafeArea(.all)

                StartView()
            }
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.all

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettingsState())
    }
}
