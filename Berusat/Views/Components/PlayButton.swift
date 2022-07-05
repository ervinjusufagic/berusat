//
//  PlayButton.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-06.
//

import SwiftUI

struct PlayButton: View {
    var body: some View {
        Button {
            print("start pressed")
        } label: {
            Typography(text: AppText.playButtonText, size: 32)
        }
        .padding(EdgeInsets(
            top: Space.sm,
            leading: Space.lg,
            bottom: Space.sm,
            trailing: Space.lg
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
