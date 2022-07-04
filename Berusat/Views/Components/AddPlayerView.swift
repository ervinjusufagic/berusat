//
//  AddPlayerView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-04.
//

import SwiftUI

struct AddPlayerView: View {
    @Binding var playerName: String
    
    var body: some View {
        ZStack() {
            if (playerName.isEmpty) {
                HStack {
                    Typography(text: AppText.playerTextFieldPlaceholder, size: 24)
                    Spacer()
                }
            }
            HStack {
                TextField("", text: $playerName)
                    .foregroundColor(Color(AppColor.lightColor))
                    .font(Font.custom(K.appFontName, size: 24))
                
                Button {
                    print("Start button was pressed")
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
        AddPlayerView(playerName: .constant("ervin"))
    }
}
