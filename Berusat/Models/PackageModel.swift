//
//  PackageModel.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import Foundation

struct Package: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var isLocked: Bool
    var emoji: String
}
