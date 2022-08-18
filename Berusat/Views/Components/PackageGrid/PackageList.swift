//
//  PackageGrid.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageList: View {
    var packages: [Package]
    var mixedPackage: Package

    var body: some View {
        ScrollView {
            VStack(spacing: Space.lg) {
                ForEach(packages) { package in
                    PackageListItem(package: package)
                }
                PackageListItem(package: mixedPackage)
            }
            .padding([.top], Space.lg)
        }
    }
}

struct PackageGrid_Previews: PreviewProvider {
    static var previews: some View {
        PackageList(
            packages: PackageState().packages,
            mixedPackage: PackageState().packages[0]
        )
        .environmentObject(UserSettingsState())
    }
}
