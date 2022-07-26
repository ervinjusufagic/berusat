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
                Typography(text: "🎉 Lås upp alla paket! 🎉", size: TextSize.mediumBody)
                Typography(text: "99kr engånskostnad!", size: TextSize.mediumBody)
            }
            .frame(maxWidth: .infinity)
            .background(Color(AppColor.darkColor))
            .padding()
        }
    }
}

struct BuyPackagesBanner_Previews: PreviewProvider {
    static var previews: some View {
        BuyPackagesBanner()
    }
}
