//
//  GameView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-06.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            Color(AppColor.darkColor)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Spacer()
                    Image(systemName: AppIcons.closeIcon)
                        .resizable()
                        .frame(width: Space.threexl, height: Space.threexl)
                        .foregroundColor(Color(AppColor.lightColor))
                        .padding(.top)
                }

                Typography(text: "Ervin", size: TextSize.title)
                Spacer()
                Typography(text: "Fråga eller nått påstående", size: TextSize.bigBody)
                Spacer()

                HStack {
                    AppButton(text: "1 straff", color: Color(AppColor.danger))
                    Spacer()
                    AppButton(text: "1 poäng", color: Color(AppColor.success))
                }
                .padding([.leading, .trailing], Space.twoxl)
            }
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
            .previewInterfaceOrientation(.landscapeRight)
    }
}
