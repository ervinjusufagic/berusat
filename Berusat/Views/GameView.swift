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

    var body: some View {
        ZStack {
            NavigationLink(destination: ScoreView(), isActive: $gameState.isGameOver) {
                EmptyView()
            }.isDetailLink(false)

            Color(AppColor.darkColor)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Spacer()

                    Image(systemName: AppIcons.closeIcon)
                        .resizable()
                        .frame(width: Space.threexl, height: Space.threexl)
                        .foregroundColor(Color(AppColor.lightColor))
                        .padding(.top)
                        .onTapGesture {
                            self.mode.wrappedValue.dismiss()
                        }
                }

                if let playerName = gameState.currentPlayer?.name {
                    Typography(text: playerName, size: TextSize.title)
                }

                Spacer()

                if let challenge = gameState.currentChallenge?.instruction {
                    Typography(text: challenge, size: TextSize.bigBody)
                }

                Spacer()

                HStack {
                    AppButton(text: "\(punishment) straff", color: Color(AppColor.danger))
                        .onTapGesture {
                            gameState.setNewTurn(after: .fail)
                        }

                    Spacer()

                    AppButton(text: "\(reward) poäng", color: Color(AppColor.success))
                        .onTapGesture {
                            gameState.setNewTurn(after: .success)
                        }
                }
                .padding([.leading, .trailing], Space.twoxl)
            }
        }
        .onAppear {
            gameState.setup(userSettings: userSettings)
            AppUtility.lockOrientation(.landscapeRight, andRotateTo: .landscapeRight)
        }
        .navigationBarHidden(true)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameState: GameState())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
