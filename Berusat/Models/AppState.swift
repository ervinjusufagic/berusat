//
//  AppState.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-04.
//

import Foundation

final class AppState: ObservableObject {
    @Published var players: [Player] = []
    
    func onAddPlayer(player: Player) {
        players.append(player)
    }
}


