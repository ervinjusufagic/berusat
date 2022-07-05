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
            
            Text("PAckages")
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
