//
//  PlayerModel.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-04.
//

import Foundation

struct Player: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var points: Int = 0
    var sips: Int = 0
}
