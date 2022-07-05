//
//  PackageListRow.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-05.
//

import SwiftUI

struct PackageListRow: View {
    var package: Package
    var body: some View {
        ZStack {
            Color(AppColor.darkColor)

            VStack(alignment: .leading) {
                Spacer()

                HStack(spacing: Space.threexl) {
                    VStack(spacing: Space.none) {
                        Typography(text: "😇", size: 32)
                        Typography(text: "Easy", size: 24)
                    }

                    Typography(text: package.name, size: 16)
                        .lineLimit(4)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
                .padding(.horizontal)

                Spacer()

                Divider()
                    .frame(height: 1)
                    .background(Color(AppColor.lightColor))
            }
        }
    }
}

struct PackageListRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PackageListRow(package: Package(name: "ervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervinervin")).previewLayout(.fixed(width: 500, height: 100))
        }
    }
}
