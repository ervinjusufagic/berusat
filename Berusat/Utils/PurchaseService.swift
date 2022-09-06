//
//  PurchaseService.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-09-05.
//

import Foundation
import RevenueCat

class PurchaseService {
    private static func getProducts(from ids: Set<String>) -> [String: Bool] {
        var idDict = [String: Bool]()

        ids.forEach { productId in
            idDict[productId] = true
        }

        return idDict
    }

    static func getRestoredProducts(onSuccess: @escaping (_ products: [String: Bool]) -> Void) {
        Purchases.shared.restorePurchases(completion: { customerInfo, _ in
            onSuccess(self.getProducts(from: customerInfo!.allPurchasedProductIdentifiers))

        })
    }

    static func getPurchasedProducts() -> [String: Bool] {
        var products = [String: Bool]()
        Purchases.shared.getCustomerInfo { customerInfo, _ in
            // catch error make escaping
            products = self.getProducts(from: customerInfo!.allPurchasedProductIdentifiers)
        }

        return products
    }

    static func purchase(productId: String?, onSuccess: @escaping () -> Void) {
        guard productId != nil else {
            return
        }

        Purchases.shared.getProducts([productId!]) { products in
            if !products.isEmpty {
                let skProduct = products[0]

                Purchases.shared.purchase(product: skProduct) { _, _, error, userCancelled in

                    if error == nil, !userCancelled {
                        onSuccess()
                    }
                }
            }
        }
    }
}
