//
//  ScoreView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-22.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            Color(AppColor.darkColor)
                .edgesIgnoringSafeArea(.all)

            Button(
                "Here is Scoreview View. Tap to go back.",
                action: { appState.isRootNavigaionLinkActive = false }
            )
        }
        .onAppear {
            AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        }
        .navigationBarHidden(true)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
