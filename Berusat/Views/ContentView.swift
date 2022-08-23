//
//  ContentView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(AppColor.darkColor)
                    .edgesIgnoringSafeArea(.all)

                StartView()
            }
        }
        .navigationViewStyle(.stack)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettingsState())
            .environmentObject(AppState())
    }
}
