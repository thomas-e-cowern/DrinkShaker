//
//  View+Extensions.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 5/9/24.
//

import Foundation
import SwiftUI

extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}
