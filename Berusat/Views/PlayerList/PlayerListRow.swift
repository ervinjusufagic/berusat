//
//  PlayerListRow.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import SwiftUI

struct PlayerListRow: View {
    var name: String
    
    var body: some View {
        ZStack {
            Color(AppColor.darkColor)
            
            VStack {
                Spacer()
                
                HStack {
                    Typography(text: name, size: 28)
                    
                    Spacer()
                    
                    Button {
                        print("delete button was pressed")
                    } label: {
                        Image(systemName: AppIcons.trashIcon)
                            .foregroundColor(.red)
                            .frame(width: Space.fourxl, height: Space.fourxl)
                    }
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

struct PlayerListRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerListRow(name: "Ervin").previewLayout(.fixed(width: 500, height: 70))
            
            PlayerListRow(name: "Ebba").previewLayout(.fixed(width: 500, height: 70))
        }
    }
}
