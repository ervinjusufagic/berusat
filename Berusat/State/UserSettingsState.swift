//
//  PlayerState.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-19.
//

import Foundation

struct InitialsUserSettings {
    /// published
    var players: [Player] = []
    var rounds: Double = K.defaultRounds
    var selectedPackage: Package? = nil
}

final class UserSettingsState: ObservableObject {
    @Published var players: [Player]
    @Published var rounds: Double
    @Published var selectedPackage: Package?

    init(initialUserSettings: InitialsUserSettings = InitialsUserSettings()) {
        self.players = initialUserSettings.players
        self.rounds = initialUserSettings.rounds
        self.selectedPackage = initialUserSettings.selectedPackage
    }

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
