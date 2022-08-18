//
//  AppState.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-04.
//

import Foundation

final class PackageState: ObservableObject {
    @Published var packages: [Package] = AppUtility.loadJSON("data.json")
    @Published var showingHowToPlay: Bool = false

    func getMixedPackage() -> Package {
        var challenges: [Challenge] = []

        packages.forEach { package in
            challenges.append(contentsOf: package.challenges)
        }

        return Package(id: "6", name: "blandat", isLocked: false, emoji: "♾️", challenges: challenges)
    }
}
