//
//  DeviceShakViewModifier.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/14/22.
//

import Foundation
import SwiftUI

struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}
