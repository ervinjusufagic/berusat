//
//  PackageItem.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageItem: View {
    @EnvironmentObject var userSettings: UserSettingsState
    @State private var animatingSelection = false

    var package: Package

    var isSelected: Bool {
        if package.id == userSettings.selectedPackage?.id {
            return true
        }
        return false
    }

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(package.isLocked
                    ? Color(AppColor.disabled)
                    : Color(AppColor.primary),
                    lineWidth: 5)
                .scaledToFill()

            VStack(spacing: Space.none) {
                Typography(text: package.emoji, size: 52)
                Typography(text: package.name, size: TextSize.body)
            }

            if isSelected {
                Image(systemName: AppIcons.selectedIcon)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(AppColor.primary))
            }

            if package.isLocked {
                Image(systemName: AppIcons.lockIcon)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(AppColor.disabled))
                    .opacity(0.8)
            }
        }
        .scaleEffect(animatingSelection ? 1.1 : 1)
        .onTapGesture {
            if package.isLocked {
                print("pressed locked package")
            } else {
                userSettings.setSelectedPackage(package)

                withAnimation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0)) {
                    animatingSelection = true
                }

                animatingSelection = false
            }
        }
        .padding()
    }
}

struct PackageItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(AppColor.darkColor)
            PackageItem(package: PackageState().packages[0])
        }
        .environmentObject(UserSettingsState())
    }
}
