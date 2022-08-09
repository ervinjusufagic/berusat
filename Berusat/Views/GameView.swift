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
    @StateObject var animations = GameViewAnimations()

    private var punishment: String {
        if let punishment = gameState.currentChallenge?.punishment {
            return String(punishment)
        }

        return ""
    }

    private var reward: String {
        if let reward = gameState.currentChallenge?.reward {
            return String(reward)
        }

        return ""
    }

    private func setNewTurn(after result: ChallengeResult, animation: AnimationType) {
        animations.animate(with: gameState.isLastPlayerOfTurn ? .afterIndividual : animation)
        gameState.setNewTurn(after: result)
    }

    private func getChallengerName() -> String {
        switch gameState.currentChallenge?.type {
        case .individual:
            if let playerName = gameState.currentPlayer?.name {
                return playerName
            } else { return "" }
        case .group:
            return "Grupputmaning!" // move out
        case .none:
            return ""
        }
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
                    Typography(text: getChallengerName(), size: TextSize.title)
                        .frame(width: nil)
                        .rotationEffect(.degrees(animations.animateNewTurn ? animations.titleDegrees : 0))
                        .offset(x: animations.animateNewTurn ? animations.xOffset : 0, y: 0)

                    if let challenge = gameState.currentChallenge?.instruction {
                        Typography(text: challenge, size: TextSize.bigBody)
                            .offset(x: animations.animateNewTurn ? animations.xOffset : 0, y: 0)
                    }
                }
                .padding([.leading, .trailing], Space.threexl)

                Spacer()
                Spacer()

                HStack {
                    if animations.showIndividualGameButtons {
                        Button {
                            setNewTurn(
                                after: .fail,
                                animation: .afterIndividualFailure
                            )
                        } label: {
                            AppButton(
                                text: "\(punishment) \(AppText.punishmentText)",
                                color: Color(AppColor.danger),
                                width: 140
                            )
                            .scaleEffect(animations.animateFailButtonPressed ? 1.2 : 1)
                        }
                        .transition(
                            .move(edge: .trailing)
                                .combined(with: .opacity)
                        )

                        Spacer()

                        Button {
                            setNewTurn(
                                after: .success,
                                animation: .afterIndividualSuccess
                            )
                        } label: {
                            AppButton(
                                text: "\(reward) \(AppText.pointsText)",
                                color: Color(AppColor.success),
                                width: 140
                            )
                            .scaleEffect(animations.animateSuccessButtonPressed ? 1.2 : 1)
                        }
                        .transition(
                            .move(edge: .leading)
                                .combined(with: .opacity)
                        )

                    } else {
                        Button {
                            setNewTurn(
                                after: .groupChallenge,
                                animation: .afterGroup
                            )
                        } label: {
                            AppButton(
                                text: "Fortsätt!",
                                color: Color(AppColor.primary),
                                width: 140
                            )
                        }
                        .transition(
                            .scale
                                .combined(with: .opacity)
                        )
                    }
                }
                .padding([.leading, .trailing], Space.threexl)
                .padding([.bottom], Space.md)
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
