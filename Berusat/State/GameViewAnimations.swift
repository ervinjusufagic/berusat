//
//  GameViewAnimations.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-08-05.
//

import Foundation
import SwiftUI

enum AnimationType {
    case afterIndividualSuccess
    case afterIndividualFailure
    case afterGroup
}

final class GameViewAnimations: ObservableObject {
    @Published var animateNewTurn: Bool = false
    @Published var animateSuccessButton = false
    @Published var animateFailButton = false
    @Published var animateGroupButton = false

    @Published var titleDegrees: Double = 0
    @Published var xOffset: Double = 0

    func animate(with type: AnimationType) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0)) {
            switch type {
            case .afterIndividualSuccess:
                animateNewTurn = true
                titleDegrees = -20
                xOffset = -500
                animateSuccessButton = true
            case .afterIndividualFailure:
                animateNewTurn = true
                titleDegrees = 20
                xOffset = 500
                animateFailButton = true
            case .afterGroup:
                animateNewTurn = true
                titleDegrees = -20
                xOffset = -500
                animateGroupButton = true
            }
        }
        animateGroupButton = false
        animateNewTurn = false
        animateSuccessButton = false
        animateFailButton = false
    }
}
