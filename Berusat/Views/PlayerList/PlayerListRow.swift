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
        VStack {
            
            Spacer()
            
            HStack {
                Text(name).font(Font.custom("NanumPen", size: 32))
                
                Spacer()
                
                Button {
                    print("delete button was pressed")
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                        .frame(width: 30, height: 30)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            Divider()
                .frame(height: 1)
                .background(Color.red)

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
