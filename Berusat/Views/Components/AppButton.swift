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

    var body: some View {
        Typography(text: text, size: TextSize.bigBody)
            .padding(EdgeInsets(
                top: Space.sm,
                leading: Space.xl,
                bottom: Space.sm,
                trailing: Space.xl
            ))
            .background(color)
            .cornerRadius(8)
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(text: AppText.playButtonText)
    }
}
