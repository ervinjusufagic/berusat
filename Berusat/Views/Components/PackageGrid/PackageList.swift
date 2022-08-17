//
//  PackageGrid.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageList: View {
    var packages: [Package]

    var body: some View {
        List(packages) { package in
            PackageListItem(package: package)
                .buttonStyle(.plain)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(.zero))
        }
        .ignoresSafeArea(.all)
        .listStyle(.plain)
    }
}

struct PackageGrid_Previews: PreviewProvider {
    static var previews: some View {
        PackageList(packages: PackageState().packages)
            .environmentObject(UserSettingsState())
    }
}
