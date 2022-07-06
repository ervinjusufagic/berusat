//
//  GameView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-06.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack {
            Color(AppColor.darkColor)
                .edgesIgnoringSafeArea(.all)

            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear {
            AppUtility.lockOrientation(.landscapeRight, andRotateTo: .landscapeRight)
        }
        .navigationBarHidden(true)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
