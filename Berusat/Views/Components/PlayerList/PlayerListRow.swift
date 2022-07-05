//
//  PlayerListRow.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import SwiftUI

struct PlayerListRow: View {
    @EnvironmentObject var appState: AppState

    var player: Player
    
    var body: some View {
        ZStack {
            Color(AppColor.darkColor)
            
            VStack {
                Spacer()
                
                HStack {
                    Typography(text: player.name, size: 28)
                    
                    Spacer()
                    
                    Button {
                        appState.onDeletePlayer(playerId: player.id)
                    } label: {
                        Image(systemName: AppIcons.trashIcon)
                            .foregroundColor(.red)
                            .frame(width: Space.fourxl, height: Space.fourxl)
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
