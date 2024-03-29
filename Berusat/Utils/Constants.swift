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
    static let packageText = "Paket"
    static let roundsSliderLabel = "Rundor"
    static let playerTextFieldPlaceholder = "Lägg till spelare.."
    static let startButtonText = "Starta"
    static let playButtonText = "Spela!"
    static let punishmentText = "Straff"
    static let pointsText = "Poäng"
    static let scoreboardTitle = "Poängtavla"
    static let playAgain = "Spela igen!"
    static let continueText = "Fortsätt!"
    static let closeGame = "Avsluta spel"
    static let understandText = "Förstått!"
    static let infoTitle = "Hur man spelar"
    static let groupChallengeText = "Grupputmaning!"
    static let restorePurchasesText = "Återställ köp"
    static let goBackText = "Tillbaka"
    static let howToPlay = "1. Läs utmaningen på kortet \n\n 2. Försök genomföra utmaningen, ta poäng eller straff beroende på om du lyckas eller inte \n\n 3. Efter en runda har gått kommer det komma en grupputmaning som alla ska delta i. \n\n 4. När alla rundor är klara kommer ni få se erat resultat. \n\n Straffen för grupputmaningarna och dom individuella utmaningarna kan ni själva välja vad det ska vara."
}

// MARK: Color

enum AppColor {
    static let darkColor = "Dark"
    static let lightColor = "Light"
    static let primary = "DarkTurquoise"
    static let disabled = "Disabled"
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
    static let selectedIcon = "checkmark"
    static let lockIcon = "lock.fill"
    static let closeIcon = "xmark"
    static let menuIcon = "ellipsis.circle"
    static let infoIcon = "info.circle"
    static let restoreIcon = "arrow.counterclockwise.circle"
}

// MARK: Space

enum Space {
    static let none = 0.0
    static let xs = 4.0
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

enum ChallengeResult {
    case success
    case fail
    case groupChallenge
}

// MARK: General

enum K {
    static let appFontName: String = "Cupid-deer"
    static let minPlayers: Int = 2
    static let minRounds: Double = 3
    static let defaultRounds: Double = 5
    static let maxRounds: Double = 10
    static let revenueCatAPIKey: String = "appl_hRpIenjRhYHWlDksyWMBNVeEAmM"
    static let freePackageId: String = "btfruktstund"
    static let premiumId: String = "btpremium"
    static let dataFile: String = "data.json"

    enum mixedPackage {
        static let id: String = "btblandat"
        static let name: String = "blandat"
        static let emoji: String = "♾️"
    }
}

// MARK: Mocks

enum Mocks {
    static let mockPlayers: [Player] = [
        Player(name: "Ervin"),
        Player(name: "Ebba"),
        Player(name: "asdf"),
        Player(name: "xvcxcv"),
    ]

    static let mockChallenges = [
        Challenge(id: "1",
                  type: ChallengeType.individual,
                  reward: 1,
                  punishment: 1,
                  instruction: "1 If a silent mission is assigned on the last round, the participant tasked with the mission has until the end of the game to finish it."),
        Challenge(id: "2",
                  type: ChallengeType.group,
                  reward: 1,
                  punishment: 1,
                  instruction: "1 If a silent mission is assigned on the last round, the participant tasked with the mission has until the end of the game to finish it."),
    ]

    static let mockPackage = Package(
        id: "1",
        name: "mockpackage",
        emoji: "😀",
        challenges: mockChallenges)
}
