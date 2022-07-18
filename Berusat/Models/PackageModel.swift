//
//  PackageModel.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import Foundation

struct Package: Codable, Identifiable {
    var id: String
    var name: String
    var isLocked: Bool
    var emoji: String

    var challenges: [Challenge]

    struct Challenge: Codable {
        var type: String
        var reward: Int
        var punishment: Int
        var instruction: String
    }
}
