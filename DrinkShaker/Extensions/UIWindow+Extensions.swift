//
//  UIWindow+Extensions.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 5/9/24.
//

import Foundation
import UIKit

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
    }
}
