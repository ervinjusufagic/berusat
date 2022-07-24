//
//  GameState.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-19.
//

import Foundation

final class GameState: ObservableObject {
    @Published var currentPlayer: Player? = nil
    @Published var currentChallenge: Challenge? = nil
    @Published var package: Package? = nil
    @Published var isGameOver: Bool = false

    private var currentPlayerIndex: Int = 0
    private var players: [Player] = []
    private var roundsToPlay: Double = 0
    private var currentRound: Double = 1

    func setup(userSettings: UserSettingsState) {
        players = userSettings.players
        package = userSettings.selectedPackage
        roundsToPlay = userSettings.rounds

        currentPlayer = players[currentPlayerIndex]
        setNewChallenge()
    }

    func setNewTurn(after lastChallengeResult: challengeResult) {
        guard var player = currentPlayer, let challenge = currentChallenge else {
            // split up guard and implement logic for when nil
            return
        }

        if lastChallengeResult == .fail {
            player.sips += challenge.punishment
        }

        if lastChallengeResult == .success {
            player.sips += challenge.punishment
        }

        updateCurrentPlayer(with: player)

        setNextPlayer()
        setNewChallenge()
    }

    private func setNewChallenge() {
        if let randomChallenge = package?.challenges.randomElement() {
            currentChallenge = randomChallenge

            package?.challenges.removeAll(where: { challenge in
                challenge.id == randomChallenge.id
            })

        } else {
            let packages: [Package] = AppUtility.loadJSON("data.json")

            var restoredPackage = packages.first { _package in
                _package.id == self.package?.id
            }

            restoredPackage?.challenges.removeAll(where: { challenge in
                challenge.id == currentChallenge?.id
            })

            package = restoredPackage

            setNewChallenge()
        }
    }

    private func updateCurrentPlayer(with updatedPlayer: Player) {
        players[currentPlayerIndex] = updatedPlayer
    }

    private func setNextPlayer() {
        let lastPlayerIndex = players.endIndex - 1

        if currentPlayerIndex == lastPlayerIndex {
            setNextRound()
        } else {
            currentPlayerIndex += 1
        }

        currentPlayer = players[currentPlayerIndex]
    }

    private func setNextRound() {
        currentPlayerIndex = 0

        if currentRound < roundsToPlay {
            currentRound += 1
        } else {
            isGameOver = true
        }
    }
}
