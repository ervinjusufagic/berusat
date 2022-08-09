//
//  GameState.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-19.
//

import Foundation

struct InitialGameState {
    /// published
    var currentPlayer: Player? = nil
    var currentChallenge: Challenge? = nil
    var package: Package? = nil
    var isGameOver: Bool = false
    var scoreboard: [Player] = []
    /// privates
    var currentPlayerIndex: Int = 0
    var players: [Player] = []
    var roundsToPlay: Double = 0
    var currentRound: Double = 1
}

final class GameState: ObservableObject {
    @Published var currentPlayer: Player?
    @Published var currentChallenge: Challenge?
    @Published var package: Package?
    @Published var isGameOver: Bool
    @Published var scoreboard: [Player]

    private var currentPlayerIndex: Int
    private var players: [Player]
    private var roundsToPlay: Double
    private var currentRound: Double

    init(initialValues: InitialGameState = InitialGameState()) {
        self.currentPlayer = initialValues.currentPlayer
        self.currentChallenge = initialValues.currentChallenge
        self.package = initialValues.package
        self.isGameOver = initialValues.isGameOver
        self.scoreboard = initialValues.scoreboard

        self.currentPlayerIndex = initialValues.currentPlayerIndex
        self.players = initialValues.players
        self.roundsToPlay = initialValues.roundsToPlay
        self.currentRound = initialValues.currentRound
    }

    func setup(userSettings: UserSettingsState) {
        players = userSettings.players
        package = userSettings.selectedPackage
        roundsToPlay = userSettings.rounds

        currentPlayer = players[currentPlayerIndex]
        setNewChallenge(with: .individual)
    }

    func setNewTurn(after lastChallengeResult: ChallengeResult) {
        guard var player = currentPlayer, let challenge = currentChallenge else {
            // split up guard and implement logic for when nil
            return
        }

        switch lastChallengeResult {
        case .success:
            player.points += challenge.reward
            setNextAndUpdate(player)
        case .fail:
            player.sips += challenge.punishment
            setNextAndUpdate(player)

        case .groupChallenge:
            setNewChallenge(with: .individual)
        }
    }

    private func setNextAndUpdate(_ player: Player) {
        updateScoreboard(with: player)

        setNextPlayer { type in
            setNewChallenge(with: type)
        }
    }

    private func updateScoreboard(with updatedPlayer: Player) {
        players[currentPlayerIndex] = updatedPlayer

        let sortedPlayers = players.sorted {
            $0.points > $1.points
        }

        scoreboard = sortedPlayers
    }

    private func setNextPlayer(setNewChallenge: (_ type: ChallengeType) -> ()) {
        let lastPlayerIndex = players.endIndex - 1

        if currentPlayerIndex == lastPlayerIndex {
            currentPlayerIndex = 0

            if currentRound < roundsToPlay {
                currentRound += 1
                setNewChallenge(.group)
            } else {
                isGameOver = true
            }

        } else {
            currentPlayerIndex += 1
            setNewChallenge(.individual)
        }

        currentPlayer = players[currentPlayerIndex]
    }

    private func setNewChallenge(with type: ChallengeType) {
        if let challenges = package?.challenges {
            let filteredChallenges = challenges.filter { challenge in
                challenge.type == type
            }

            if let randomChallenge = filteredChallenges.randomElement() {
                currentChallenge = randomChallenge

                package?.challenges.removeAll(where: { challenge in
                    challenge.id == randomChallenge.id
                })
            } else {
                reloadPackages {
                    setNewChallenge(with: type)
                }
            }
        }
    }

    private func reloadPackages(completion: () -> ()) {
        let packages: [Package] = AppUtility.loadJSON("data.json")

        var restoredPackage = packages.first { _package in
            _package.id == self.package?.id
        }

        restoredPackage?.challenges.removeAll(where: { challenge in
            challenge.id == currentChallenge?.id
        })

        package = restoredPackage

        completion()
    }
}
