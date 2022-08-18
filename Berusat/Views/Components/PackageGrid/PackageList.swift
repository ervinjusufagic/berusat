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
            VStack {
                ForEach(packages) { package in
                    PackageListItem(package: package)
                }
                PackageListItem(package: mixedPackage)
            }
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
