//
//  PackageSelector.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageSelectorView: View {
    @StateObject var packageState = PackageState()
    @EnvironmentObject var userSettingsState: UserSettingsState
    @GestureState private var dragOffset = CGSize.zero
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            Color(AppColor.darkColor)
                .edgesIgnoringSafeArea(.all)

            VStack {
                PackageList(packages: packageState.packages)

                NavigationLink {
                    GameView()
                } label: {
                    AppButton(text: AppText.playButtonText)
                }
                .isDetailLink(false)
                .padding([.all], Space.lg)

                Button {
                    print("banner pressed")
                } label: {
                    BuyPackagesBanner()
                }
            }
            .padding([.top], Space.xs)
        }
        .onAppear {
            userSettingsState.setSelectedPackage(packageState.packages[0])
            DispatchQueue.main.async {
                AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: StartView()) {
                    BackButton()
                }
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
        PackageSelectorView()
            .environmentObject(AppState())
            .environmentObject(UserSettingsState())
    }
}
