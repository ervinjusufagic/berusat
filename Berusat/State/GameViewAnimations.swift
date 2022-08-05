//
//  GameViewAnimations.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-08-05.
//

import Foundation
import SwiftUI

final class GameViewAnimations: ObservableObject {
    @Published var animateNewTurn: Bool = false
    @Published var animateSuccessButton = false
    @Published var animateFailButton = false
    @Published var titleDegrees: Double = 0
    @Published var xOffset: Double = 0

    func animate(after result: ChallengeResult) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0)) {
            switch result {
            case .success:
                animateNewTurn = true
                titleDegrees = -20
                xOffset = -500
                animateSuccessButton = true
            case .fail:
                animateNewTurn = true
                titleDegrees = 20
                xOffset = 500
                animateFailButton = true
            }
        }
        animateNewTurn = false
        animateSuccessButton = false
        animateFailButton = false
    }
}
