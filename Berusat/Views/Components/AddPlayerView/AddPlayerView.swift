//
//  AddPlayerView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-04.
//

import SwiftUI

struct AddPlayerView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var addPlayerViewModel = AddPlayerViewModel()

    var body: some View {
        ZStack {
            if addPlayerViewModel.playerName.isEmpty {
                HStack {
                    Typography(text: AppText.playerTextFieldPlaceholder, size: TextSize.body)
                    Spacer()
                }
            }
            HStack {
                TextField("", text: $addPlayerViewModel.playerName)
                    .foregroundColor(Color(AppColor.lightColor))
                    .font(Font.custom(K.appFontName, size: TextSize.body))
                    .keyboardType(.webSearch)
                    .disableAutocorrection(true)
                    .onSubmit {
                        if !addPlayerViewModel.playerName.isEmpty {
                            appState.onAddPlayer(player: Player(name: addPlayerViewModel.playerName))
                            addPlayerViewModel.resetPlayerName()
                        }
                    }
            }
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}
