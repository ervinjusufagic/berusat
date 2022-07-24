//
//  PlayerState.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-19.
//

import Foundation

// UserActions? UserSettings?
final class UserSettingsState: ObservableObject {
    // Test players: [Player(name: "Ervin"), Player(name: "Ebba"), Player(name: "asdf"), Player(name: "xvcxcv")]
    @Published var players: [Player] = []
    @Published var rounds: Double = 3
    @Published var selectedPackage: Package? = nil

    // MARK: Package Actions

    func setSelectedPackage(_ package: Package) {
        selectedPackage = package
    }

    // MARK: Player Actions

    func addPlayer(_ player: Player) {
        players.append(player)
    }

    func deletePlayer(with playerId: String) {
        if let index = players.firstIndex(where: { $0.id == playerId }) {
            players.remove(at: index)
        }
    }
}
