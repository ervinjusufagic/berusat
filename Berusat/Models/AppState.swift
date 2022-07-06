//
//  AppState.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-04.
//

import Foundation

final class AppState: ObservableObject {
    @Published var players: [Player] = []
    @Published var rounds: Double = 3
    @Published var selectedPackage: Package? = nil

    // MARK: Player

    func onAddPlayer(player: Player) {
        players.append(player)
    }

    func onDeletePlayer(playerId: String) {
        if let index = players.firstIndex(where: { $0.id == playerId }) {
            players.remove(at: index)
        }
    }

    // MARK: Package

    func setSelectedPackage(_ package: Package) {
        selectedPackage = package
    }
}
