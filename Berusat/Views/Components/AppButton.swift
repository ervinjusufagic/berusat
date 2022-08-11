//
//  PlayButton.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-06.
//

import SwiftUI

struct AppButton: View {
    var text: String
    var color: Color = .init(AppColor.primary)
    var width: CGFloat?
    var height: CGFloat = 32

    var body: some View {
        Typography(text: text, size: TextSize.bigBody)
            .frame(maxWidth: 1000)
            .frame(width: width ?? nil, height: height)
            .padding(EdgeInsets(
                top: Space.sm,
                leading: Space.xl,
                bottom: Space.sm,
                trailing: Space.xl
            ))
            .background(color)
            .cornerRadius(12)
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(text: AppText.playButtonText)
    }
}
