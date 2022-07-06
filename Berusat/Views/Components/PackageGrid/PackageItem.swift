//
//  PackageItem.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageItem: View {
    @EnvironmentObject var appState: AppState

    var package: Package

    var isSelected: Bool {
        if package.id == appState.selectedPackage?.id {
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
                Typography(text: package.emoji, size: 82)
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
        .onTapGesture {
            if package.isLocked {
                print("pressed locked package")
            } else {
                appState.setSelectedPackage(package)
            }
        }
        .padding()
    }
}

struct PackageItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(AppColor.darkColor)
            PackageItem(package: Package(name: "Hello", isLocked: false, emoji: "😀"))
        }
        .environmentObject(AppState())
    }
}
