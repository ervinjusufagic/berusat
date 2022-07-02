//
//  StartView.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import SwiftUI

struct StartView: View {
    
    @State private var name = ""
    @State private var sliderValue = 0.8
    
    var body: some View {
        VStack {
            Text("Berusat").font(Font.custom("NanumPen", size: 52))
            
            PlayerList(players: ["Ervin", "Ebba"])
            
            Slider(value: $sliderValue)
            TextField("Placeholder", text: $name)
        }
        .padding()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
