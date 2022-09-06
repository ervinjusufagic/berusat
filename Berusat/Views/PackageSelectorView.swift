//
//  PackageSelector.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageSelectorView: View {
    @EnvironmentObject var packageState: PackageState
    @EnvironmentObject var userSettingsState: UserSettingsState
    @GestureState private var dragOffset = CGSize.zero
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            Color(AppColor.darkColor)
                .edgesIgnoringSafeArea(.all)

            VStack {
                PackageList()

                NavigationLink {
                    GameView()
                } label: {
                    AppButton(text: AppText.playButtonText)
                }
                .isDetailLink(false)
                .padding([.all], Space.lg)

                if !packageState.isPremium {
                    Button {
                        packageState.purchasePremium()
                    } label: {
                        BuyPackagesBanner()
                    }
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
                Typography(text: AppText.packageText, size: TextSize.body)
                    .minimumScaleFactor(0.5)
                    .fixedSize(horizontal: true, vertical: false)
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button {
                        packageState.showingHowToPlay = true
                    } label: {
                        Label(AppText.infoTitle, systemImage: AppIcons.infoIcon)
                    }

                    Button {
                        packageState.restorePurchases()
                    } label: {
                        Label(AppText.restorePurchasesText, systemImage: AppIcons.restoreIcon)
                    }

                } label: {
                    Image(systemName: AppIcons.menuIcon)
                        .resizable()
                        .frame(width: Space.threexl, height: Space.threexl)
                        .foregroundColor(Color(AppColor.lightColor))
                }
            }
        }
        .alert(isPresented: $packageState.showingHowToPlay) {
            Alert(title: Text(AppText.infoTitle), message: Text(AppText.howToPlay), dismissButton: .default(Text(AppText.understandText)))
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
