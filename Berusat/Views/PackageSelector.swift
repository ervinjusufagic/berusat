//
//  PackageSelector.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageSelector: View {
    var body: some View {
        ZStack {
            Color(AppColor.darkColor)
                .edgesIgnoringSafeArea(.all)

            VStack {
                PackageGrid(packages: [
                    Package(name: "Easy", isLocked: false, emoji: "😇"),
                    Package(name: "Medium", isLocked: true, emoji: "😝"),
                    Package(name: "Hard", isLocked: true, emoji: "🤪"),
                ])

                PlayButton()

                BuyPackagesBanner()
            }
        }
        .navigationTitle("Paket")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PackageSelector_Previews: PreviewProvider {
    static var previews: some View {
        PackageSelector()
            .environmentObject(AppState())
    }
}
