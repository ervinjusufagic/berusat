//
//  PackageSelector.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageSelector: View {
    var body: some View {
        ZStack {
            Color(AppColor.darkColor)
                .edgesIgnoringSafeArea(.all)

            PackageList(packages: [Package(name: "ervin"), Package(name: "asDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASdasDSDADASd"), Package(name: "ervin")])
                .padding()
        }
        .navigationTitle("Paket")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PackageSelector_Previews: PreviewProvider {
    static var previews: some View {
        PackageSelector()
    }
}
