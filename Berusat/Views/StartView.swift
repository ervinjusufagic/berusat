//
//  StartView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var appState: AppState

    var isStartDisabled: Bool {
        appState.players.count < K.minPlayers
    }

    var body: some View {
        VStack {
            Typography(text: AppText.appTitle, size: 52)

            PlayerList(players: appState.players)

            RoundsSlider(value: $appState.rounds)

            HStack {
                AddPlayerView()

                StartButton(isDisabled: isStartDisabled)
            }
        }
        .padding()
        .navigationBarHidden(true)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color(AppColor.darkColor)
                    .edgesIgnoringSafeArea(.all)
                StartView()
            }
        }.environmentObject(AppState())
    }
}
