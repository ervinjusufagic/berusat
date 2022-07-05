//
//  PlayerList.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import SwiftUI

struct PlayerList: View {
    var players: [Player]
    
    var body: some View {
        List(players){ player in
            PlayerListRow(player: player)
                .buttonStyle(.plain)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(.zero))
            
        }
        .ignoresSafeArea(.all)
        .listStyle(.plain)
        
        
    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList(players: [])
    }
}
