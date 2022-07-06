//
//  PlayButton.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-06.
//

import SwiftUI

struct PlayButton: View {
    var body: some View {
        Button {} label: {
            NavigationLink(destination: GameView()) {
                Typography(text: AppText.playButtonText, size: TextSize.bigBody)
            }
        }
        .padding(EdgeInsets(
            top: Space.sm,
            leading: Space.xl,
            bottom: Space.sm,
            trailing: Space.xl
        ))
        .background(Color(AppColor.primary))
        .cornerRadius(8)
        .padding()
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton()
    }
}
