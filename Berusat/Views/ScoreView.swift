//
//  ScoreView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-22.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var appState: AppState

    var scoreboard: [Player]

    var body: some View {
        ZStack {
            Color(AppColor.darkColor)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Typography(text: AppText.scoreboardTitle, size: TextSize.title)

                Spacer()

                List(0 ..< scoreboard.count, id: \.self) { i in

                    let player: Player = scoreboard[i]

                    ZStack {
                        Color(AppColor.darkColor)

                        VStack {
                            Spacer()

                            HStack {
                                Typography(text: "\(String(i + 1)). ", size: TextSize.mediumBody)

                                Typography(text: player.name, size: TextSize.mediumBody)

                                Spacer()

                                VStack {
                                    Typography(text: "\(player.points) \(AppText.pointsText)", size: TextSize.mediumBody)
                                    Typography(text: "\(player.sips) \(AppText.punishmentText)", size: TextSize.mediumBody)
                                }
                            }
                            .padding(.horizontal)

                            Spacer()

                            Divider()
                                .frame(height: 1)
                                .background(Color(AppColor.lightColor))
                        }
                    }
                    .buttonStyle(.plain)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(.zero))
                }
                .ignoresSafeArea(.all)
                .listStyle(.plain)

                Button {
                    appState.isRootNavigaionLinkActive = false
                } label: {
                    AppButton(text: AppText.playAgain)
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
        .onAppear {
            DispatchQueue.main.async {
                AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(scoreboard: [Player(id: "1", name: "Ervin", points: 10, sips: 20)])
    }
}
