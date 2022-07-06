//
//  PackageSelector.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageSelector: View {
    @GestureState private var dragOffset = CGSize.zero
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

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
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton()
            }

            ToolbarItem(placement: .principal) {
                Typography(text: "Paket", size: TextSize.body)
                    .minimumScaleFactor(0.5)
                    .fixedSize(horizontal: true, vertical: false)
            }
        }

        .gesture(DragGesture().updating($dragOffset, body: { value, _, _ in
            if value.startLocation.x < 20, value.translation.width > 100 {
                self.mode.wrappedValue.dismiss()
            }
        }))
    }
}

struct PackageSelector_Previews: PreviewProvider {
    static var previews: some View {
        PackageSelector()
            .environmentObject(AppState())
    }
}
