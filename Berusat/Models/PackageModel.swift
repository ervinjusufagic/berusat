//
//  PackageModel.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import Foundation

enum ChallengeType: String, Codable {
    case individual
    case group
}

struct Package: Codable, Identifiable {
    var id: String
    var name: String
    var isLocked: Bool
    var emoji: String

    var challenges: [Challenge]
}

struct Challenge: Codable {
    var id: String
    var type: ChallengeType
    var reward: Int
    var punishment: Int
    var instruction: String
}
