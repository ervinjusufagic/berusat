//
//  StartView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var userSettings: UserSettingsState

    var isStartDisabled: Bool {
        userSettings.players.count < K.minPlayers
    }

    var body: some View {
        VStack {
            Typography(text: AppText.appTitle, size: TextSize.title)

            PlayerList(players: userSettings.players)

            RoundsSlider(value: $userSettings.rounds)

            HStack {
                AddPlayerTextField(onAddPlayer: userSettings.addPlayer)

                StartButton(isDisabled: isStartDisabled)
            }
        }
        .onAppear {
            AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
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
        }.environmentObject(UserSettingsState())
    }
}
