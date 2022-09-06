//
//  BuyPackagesBanner.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct BuyPackagesBanner: View {
    var body: some View {
        VStack(spacing: Space.none) {
            Divider()
                .frame(height: 1)
                .background(Color(AppColor.lightColor))
                .ignoresSafeArea(.all)

            VStack {
                Typography(text: "🎉 Premium 🎉", size: TextSize.mediumBody)
                Typography(text: "🎉 Alla paket + framtida paket + blandat 🎉", size: TextSize.smallBody)
            }
            .frame(maxWidth: .infinity)
            .background(Color(AppColor.darkColor))
            .padding(.all, Space.lg)
        }
    }
}

struct BuyPackagesBanner_Previews: PreviewProvider {
    static var previews: some View {
        BuyPackagesBanner()
    }
}
