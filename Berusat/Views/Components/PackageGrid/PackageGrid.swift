//
//  PackageGrid.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageGrid: View {
    var packages: [Package]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
            ]) {
                ForEach(packages) { package in
                    PackageItem(package: package)
                }
            }
        }
    }
}

struct PackageGrid_Previews: PreviewProvider {
    static var previews: some View {
        PackageGrid(packages: [
            Package(name: "Easy", isLocked: false, emoji: "😇"),
            Package(name: "Medium", isLocked: true, emoji: "😝"),
            Package(name: "Hard", isLocked: true, emoji: "🤪"),
        ]).environmentObject(AppState())
    }
}
