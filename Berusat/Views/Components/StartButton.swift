//
//  StartButton.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct StartButton: View {
    var isDisabled: Bool

    var buttonColor: Color {
        isDisabled ? Color(AppColor.disabled) : Color(AppColor.primary)
    }

    var body: some View {
        HStack(alignment: .center, spacing: Space.none) {
            Typography(text: AppText.startButtonText, size: TextSize.body, color: buttonColor)
            Image(systemName: AppIcons.rightArrowIcon)
                .foregroundColor(buttonColor)
                .frame(width: Space.fourxl, height: Space.fourxl)
        }
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton(isDisabled: true)
    }
}
