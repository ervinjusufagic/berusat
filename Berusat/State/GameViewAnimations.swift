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
    case afterIndividual
}

final class GameViewAnimations: ObservableObject {
    @Published var animateNewTurn: Bool = false
    @Published var animateSuccessButtonPressed: Bool = false
    @Published var animateFailButtonPressed: Bool = false
    @Published var showIndividualGameButtons: Bool = true
    @Published var animateIndividualGameButtonsAppearing: Bool = false

    @Published var titleDegrees: Double = 0
    @Published var xOffset: Double = 0

    func animate(with type: AnimationType) {
        switch type {
        case .afterIndividualSuccess:
            withSpring {
                animateNewTurn = true
                titleDegrees = -20
                xOffset = -500
                animateSuccessButtonPressed = true
            }

        case .afterIndividualFailure:
            withSpring {
                animateNewTurn = true
                titleDegrees = 20
                xOffset = 500
                animateFailButtonPressed = true
            }

        case .afterGroup:
            withSpring {
                animateNewTurn = true
                titleDegrees = -20
                xOffset = -500
                animateIndividualGameButtonsAppearing = true
            }
            linear {
                showIndividualGameButtons = true
            }

        case .afterIndividual:
            withSpring {
                animateNewTurn = true
                titleDegrees = -20
                xOffset = -500
            }
            linear {
                showIndividualGameButtons = false
            }
        }

        animateNewTurn = false
        animateSuccessButtonPressed = false
        animateFailButtonPressed = false
        animateIndividualGameButtonsAppearing = false
    }

    private func withSpring(_ completion: () -> ()) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0)) {
            completion()
        }
    }

    private func linear(_ completion: () -> ()) {
        withAnimation(.linear(duration: 0.1)) {
            completion()
        }
    }
}
