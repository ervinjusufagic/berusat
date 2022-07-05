//
//  StartView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var appState: AppState
    @State private var sliderValue = 0.8
    
    var body: some View {
        VStack {
            Typography(text: AppText.appTitle, size: 52)
            
            PlayerList(players: $appState.players)
            
            RoundsSlider(value: $sliderValue)

            AddPlayerView()
            
        }
        .padding()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color(AppColor.darkColor)
                    .edgesIgnoringSafeArea(.all)
                StartView()
            }
        }
    }
}






