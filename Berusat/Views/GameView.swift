//
//  GameView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-06.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @EnvironmentObject var userSettings: UserSettingsState
    @StateObject var gameState = GameState()

    @State private var animateNewTurn: Bool = false
    @State private var titleDegrees: Double = 0
    @State private var xOffset: Double = 0
    @State private var animateSuccessButton = false
    @State private var animateFailButton = false

    var punishment: String {
        if let punishment = gameState.currentChallenge?.punishment {
            return String(punishment)
        }

        return ""
    }

    var reward: String {
        if let reward = gameState.currentChallenge?.reward {
            return String(reward)
        }

        return ""
    }

    func setNewTurn(after result: ChallengeResult) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0)) {
            switch result {
            case .success:
                animateNewTurn = true
                titleDegrees = -20
                xOffset = -500
                animateSuccessButton = true
            case .fail:
                animateNewTurn = true
                titleDegrees = 20
                xOffset = 500
                animateFailButton = true
            }
        }
        animateNewTurn = false
        animateSuccessButton = false
        animateFailButton = false

        gameState.setNewTurn(after: result)
    }

    var body: some View {
        ZStack {
            NavigationLink(destination: ScoreView(scoreboard: gameState.scoreboard), isActive: $gameState.isGameOver) {
                EmptyView()
            }.isDetailLink(false)

            Color(AppColor.darkColor)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Spacer()

                    Button {
                        self.mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: AppIcons.closeIcon)
                            .resizable()
                            .frame(width: Space.threexl, height: Space.threexl)
                            .foregroundColor(Color(AppColor.lightColor))
                            .padding(.top)
                    }
                }

                Spacer()

                VStack(alignment: .center, spacing: Space.lg) {
                    if let playerName = gameState.currentPlayer?.name {
                        Typography(text: playerName, size: TextSize.title)
                            .rotationEffect(.degrees(animateNewTurn ? titleDegrees : 0))
                            .offset(x: animateNewTurn ? xOffset : 0, y: 0)
                    }

                    if let challenge = gameState.currentChallenge?.instruction {
                        Typography(text: challenge, size: TextSize.bigBody)
                            .offset(x: animateNewTurn ? xOffset : 0, y: 0)
                    }
                }
                .padding([.leading, .trailing], Space.threexl)

                Spacer()
                Spacer()

                HStack {
                    Button {
                        setNewTurn(after: .fail)
                    } label: {
                        AppButton(text: "\(punishment) \(AppText.punishmentText)", color: Color(AppColor.danger), width: 140)
                            .scaleEffect(animateFailButton ? 1.2 : 1)
                    }

                    Spacer()

                    Button {
                        setNewTurn(after: .success)
                    } label: {
                        AppButton(text: "\(reward) \(AppText.pointsText)", color: Color(AppColor.success), width: 140)
                            .scaleEffect(animateSuccessButton ? 1.2 : 1)
                    }
                }
                .padding([.leading, .trailing], Space.threexl)
            }
        }
        .onAppear {
            gameState.setup(userSettings: userSettings)

            DispatchQueue.main.async {
                AppUtility.lockOrientation(.landscapeRight, andRotateTo: .landscapeRight)
            }
        }
        .navigationBarHidden(true)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(
            gameState: GameState(
                initialValues: InitialGameState(
                    currentPlayer: Mocks.mockPlayers[0],
                    currentChallenge: Mocks.mockChallenges[0],
                    package: Mocks.mockPackage,
                    isGameOver: false,
                    scoreboard: Mocks.mockPlayers,
                    currentPlayerIndex: 0,
                    players: Mocks.mockPlayers,
                    roundsToPlay: 3,
                    currentRound: 1
                )
            )
        )
        .previewInterfaceOrientation(.landscapeRight)
        .environmentObject(
            UserSettingsState(
                initialUserSettings: InitialsUserSettings(
                    players: Mocks.mockPlayers,
                    rounds: 3,
                    selectedPackage: Mocks.mockPackage
                )
            )
        )
    }
}
