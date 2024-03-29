//
//  BackButton.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-06.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        HStack {
            Image(systemName: AppIcons.leftArrowIcon)
                .foregroundColor(Color(AppColor.primary))

            Typography(text: AppText.goBackText, size: TextSize.smallBody, color: Color(AppColor.primary))
                .minimumScaleFactor(0.5)
                .fixedSize(horizontal: true, vertical: false)
        }
        .onTapGesture {
            self.mode.wrappedValue.dismiss()
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
