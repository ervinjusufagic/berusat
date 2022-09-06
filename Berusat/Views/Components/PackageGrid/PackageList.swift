//
//  PackageGrid.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageList: View {
    @EnvironmentObject var packageState: PackageState

    var body: some View {
        ScrollView {
            VStack(spacing: Space.lg) {
                ForEach(packageState.packages) { package in
                    PackageListItem(package: package)
                }
                PackageListItem(package: packageState.getMixedPackage())
            }
            .padding([.top], Space.lg)
        }
    }
}

struct PackageGrid_Previews: PreviewProvider {
    static var previews: some View {
        PackageList()
            .environmentObject(UserSettingsState())
            .environmentObject(PackageState())
    }
}
