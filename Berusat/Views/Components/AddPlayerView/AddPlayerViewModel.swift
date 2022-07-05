//
//  AddPlayerViewModel.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-04.
//

import Foundation
import SwiftUI

final class AddPlayerViewModel: ObservableObject {
    @Published var playerName: String = ""
    
    func resetPlayerName() {
        playerName = ""
    }
}
