//
//  Typography.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-04.
//

import SwiftUI

struct Typography: View {
    var text: String
    var size: CGFloat
    var color: Color = .init(AppColor.lightColor)

    var body: some View {
        Text(text)
            .font(Font.custom(K.appFontName, size: size))
            .foregroundColor(color)
    }
}

struct Typography_Previews: PreviewProvider {
    static var previews: some View {
        Typography(text: AppText.appTitle, size: 52)
    }
}
