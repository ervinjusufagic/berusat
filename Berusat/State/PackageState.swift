//
//  AppState.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-04.
//

import Foundation

final class PackageState: ObservableObject {
    @Published var packages: [Package] = AppUtility.loadJSON("data.json")
}
