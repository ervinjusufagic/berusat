//
//  PlayerListRow.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import SwiftUI

struct PlayerListRow: View {
    @EnvironmentObject var userSettings: UserSettingsState

    var player: Player
    
    var body: some View {
        ZStack {
            Color(AppColor.darkColor)
            
            VStack {
                Spacer()
                
                HStack {
                    Typography(text: player.name, size: TextSize.mediumBody)
                    
                    Spacer()
                    
                    Button {
                        userSettings.deletePlayer(with: player.id)
                    } label: {
                        Image(systemName: AppIcons.trashIcon)
                            .foregroundColor(.red)
                            .frame(width: Space.fivexl, height: Space.fivexl)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Divider()
                    .frame(height: 1)
                    .background(Color(AppColor.lightColor))
            }
        }
    }
}

struct PlayerListRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerListRow(player: Player(name: "ervin")).previewLayout(.fixed(width: 500, height: 70))

            PlayerListRow(player: Player(name: "ebba")).previewLayout(.fixed(width: 500, height: 70))
        }
    }
}
