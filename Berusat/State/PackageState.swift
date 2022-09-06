//
//  AppState.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-04.
//

import Foundation

final class PackageState: ObservableObject {
    @Published var packages: [Package] = AppUtility.loadJSON(K.dataFile)
    @Published var showingHowToPlay: Bool = false
    @Published var userPurchases = [String: Bool]()
    @Published var isPremium: Bool = false

    init() {
        let purchases = PurchaseService.getPurchasedProducts()

        self.userPurchases = purchases
        self.userPurchases[K.freePackageId] = true

        self.isPremium = purchases[K.premiumId] == true
    }

    func getMixedPackage() -> Package {
        var challenges: [Challenge] = []

        self.packages.forEach { package in
            challenges.append(contentsOf: package.challenges)
        }

        return Package(id: K.mixedPackage.id, name: K.mixedPackage.name, emoji: K.mixedPackage.emoji, challenges: challenges)
    }

    func makePurchase(package: Package) {
        PurchaseService.purchase(productId: package.id) {
            self.userPurchases[package.id] = true
        }
    }

    func purchasePremium() {
        PurchaseService.purchase(productId: K.premiumId) {
            self.userPurchases[K.premiumId] = true
        }
    }

    func restorePurchases() {
        PurchaseService.getRestoredProducts { products in // weak self
            self.userPurchases = products
            self.userPurchases[K.freePackageId] = true
            self.isPremium = products[K.premiumId] == true
        }
    }
}
