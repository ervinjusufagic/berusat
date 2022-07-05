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
        ZStack() {
            if (addPlayerViewModel.playerName.isEmpty) {
                HStack {
                    Typography(text: AppText.playerTextFieldPlaceholder, size: 24)
                    Spacer()
                }
            }
            HStack {
                TextField("", text: $addPlayerViewModel.playerName)
                    .foregroundColor(Color(AppColor.lightColor))
                    .font(Font.custom(K.appFontName, size: 24))
                    .keyboardType(.webSearch)
                    .disableAutocorrection(true)
                    .onSubmit {
                        if (!addPlayerViewModel.playerName.isEmpty) {
                            appState.onAddPlayer(player: Player(name: addPlayerViewModel.playerName))
                            addPlayerViewModel.resetPlayerName()
                            
                        }
                    }
                
                Button {
                    print("start button was pressed")
                    print(appState.players)
                    print(appState.rounds)
                } label: {
                    HStack(alignment: .center, spacing: Space.none) {
                        Typography(text: AppText.startButtonText, size: 24, color: Color(AppColor.primary))
                        Image(systemName: AppIcons.rightArrowIcon)
                            .foregroundColor(Color(AppColor.primary))
                            .frame(width: Space.fourxl, height: Space.fourxl)
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
