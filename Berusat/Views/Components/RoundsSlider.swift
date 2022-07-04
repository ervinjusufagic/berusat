//
//  RoundsSlider.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-04.
//

import SwiftUI

struct RoundsSlider: View {
    @Binding var value: Double
    
    var body: some View {
        VStack(spacing: Space.none) {
            HStack {
                Typography(text: AppText.roundsSliderLabel, size: 24)
                Spacer()
                Typography(text: "5", size: 24)
            }
            
            Slider(value: $value)
                .accentColor(Color(AppColor.lightColor))
        }
        .padding(EdgeInsets(top: Space.none, leading: Space.none, bottom: Space.lg, trailing: Space.none))
    }
}

struct RoundsSlider_Previews: PreviewProvider {
    static var previews: some View {
        RoundsSlider(value: .constant(0.5))
    }
}
