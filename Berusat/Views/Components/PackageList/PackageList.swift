//
//  PackageList.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageList: View {
    var packages: [Package]

    var body: some View {
        List(packages) { package in
            PackageListRow(package: package)
                .buttonStyle(.plain)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(.zero))
        }
        .ignoresSafeArea(.all)
        .listStyle(.plain)
    }
}

struct PackageList_Previews: PreviewProvider {
    static var previews: some View {
        PackageListRow(package: Package(name: "First"))
    }
}
