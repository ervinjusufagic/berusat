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
        ScrollView {
            VStack(spacing: Space.lg) {
                ForEach(players) { player in
                    PlayerListRow(player: player)
                }
            }
        }
    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList(players: [Player(name: "Ervin"), Player(name: "Ervin")])
    }
}
