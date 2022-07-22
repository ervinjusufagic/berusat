//
//  Constants.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-02.
//

import Foundation

// MARK: Text

struct AppText {
    static let appTitle = "berusat"
    static let roundsSliderLabel = "Rundor"
    static let playerTextFieldPlaceholder = "Lägg till spelare.."
    static let startButtonText = "Starta"
    static let playButtonText = "Spela!"
}

// MARK: Color

enum AppColor {
    static let darkColor = "Dark"
    static let lightColor = "Light"
    static let primary = "DarkTurquoise"
    static let disabled = "DarkGrey"
    static let danger = "DarkRed"
    static let success = "DarkGreen"

    static let AppColorNames: [String] = [
        "LightBlue",
        "LightGreen",
        "LightOrange",
        "LightPink",
        "LightPurple",
        "LightRed",
        "LightTurquoise",
        "LightYellow",
        "LightGrey",
        "Light",
        "DarkBlue",
        "DarkGreen",
        "DarkOrange",
        "DarkPink",
        "DarkPurple",
        "DarkRed",
        "DarkTurquoise",
        "DarkYellow",
    ]
}

// MARK: Icons

enum AppIcons {
    static let rightArrowIcon = "arrowshape.turn.up.right.fill"
    static let leftArrowIcon = "arrowshape.turn.up.left.fill"
    static let trashIcon = "trash"
    static let selectedIcon = "checkmark.circle"
    static let lockIcon = "lock.circle"
    static let closeIcon = "xmark.circle"
}

// MARK: Space

enum Space {
    static let none = 0.0
    static let sm = 8.0
    static let md = 12.0
    static let lg = 16.0
    static let xl = 20.0
    static let twoxl = 24.0
    static let threexl = 28.0
    static let fourxl = 32.0
    static let fivexl = 36.0
}

// MARK: TextSize

enum TextSize {
    static let title = 52.0
    static let smallBody = 20.0
    static let body = 24.0
    static let mediumBody = 28.0
    static let bigBody = 32.0
}

// MARK: Game

enum challengeResult {
    case success
    case fail
}

// MARK: General

enum K {
    static let appFontName: String = "Cupid-deer"
    static let minPlayers: Int = 0
    static let minRounds: Double = 1
    static let maxRounds: Double = 5
}
