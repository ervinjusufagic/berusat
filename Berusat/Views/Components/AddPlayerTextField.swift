//
//  AddPlayerView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-04.
//

import SwiftUI

struct AddPlayerTextField: View {
    @State var playerName: String = ""

    var onAddPlayer: (_ player: Player) -> Void

    func resetPlayerName() {
        playerName = ""
    }

    var body: some View {
        ZStack {
            if playerName.isEmpty {
                HStack {
                    Typography(text: AppText.playerTextFieldPlaceholder, size: TextSize.body)
                    Spacer()
                }
            }
            HStack {
                TextField("", text: $playerName)
                    .foregroundColor(Color(AppColor.lightColor))
                    .font(Font.custom(K.appFontName, size: TextSize.body))
                    .keyboardType(.webSearch)
                    .disableAutocorrection(true)
                    .onSubmit {
                        if !playerName.isEmpty {
                            onAddPlayer(Player(name: playerName))
                            resetPlayerName()
                        }
                    }
            }
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerTextField { _ in
        }
    }
}
