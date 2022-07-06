//
//  AppUtility.swift
//  Berusat
//
//  Created by Ervin Jusufagic on 2022-07-06.
//

import Foundation
import SwiftUI

struct AppUtility {
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation: UIInterfaceOrientation) {
        DispatchQueue.main.async {
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")

            AppDelegate.orientationLock = orientation
        }
    }
}
