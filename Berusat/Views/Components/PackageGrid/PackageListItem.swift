//
//  PackageItem.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageListItem: View {
    @EnvironmentObject var userSettings: UserSettingsState
    @EnvironmentObject var packageState: PackageState
    @State private var animatingSelection = false

    var package: Package

    var isSelected: Bool {
        if package.id == userSettings.selectedPackage?.id {
            return true
        }
        return false
    }

    var isLocked: Bool {
        return packageState.isPremium ? false : packageState.userPurchases[package.id] == nil
    }

    var body: some View {
        ZStack {
            Color(AppColor.darkColor)

            HStack(alignment: .center, spacing: Space.lg) {
                Typography(text: package.emoji, size: 52)
                Typography(text: package.name, size: TextSize.body)

                Spacer()

                if isSelected {
                    Image(systemName: AppIcons.selectedIcon)
                        .resizable()
                        .frame(width: Space.fourxl, height: Space.fourxl)
                        .foregroundColor(Color(AppColor.primary))
                }

                if isLocked {
                    Image(systemName: AppIcons.lockIcon)
                        .resizable()
                        .frame(width: Space.twoxl, height: Space.fourxl)
                        .foregroundColor(Color(AppColor.primary))
                }
            }
            .padding([.all], Space.md)
            .background(
                LinearGradient(
                    colors: [Color(AppColor.primary), Color(AppColor.darkColor)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .cornerRadius(12)
            )
            .opacity(isLocked ? 0.5 : 1)
            .scaleEffect(animatingSelection ? 1.1 : 1)
            .onTapGesture {
                if isLocked {
                    if package.id == K.mixedPackage.id {
                        packageState.purchasePremium()
                    } else {
                        packageState.makePurchase(package: package)
                    }
                } else {
                    userSettings.setSelectedPackage(package)

                    withAnimation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0)) {
                        animatingSelection = true
                    }

                    animatingSelection = false
                }
            }

            .padding([.horizontal], Space.lg)
        }
    }
}

struct PackageItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(AppColor.darkColor)
            PackageListItem(package: PackageState().packages[0])
        }
        .environmentObject(UserSettingsState())
    }
}
