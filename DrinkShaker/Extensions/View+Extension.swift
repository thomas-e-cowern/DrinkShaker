//
//  View+Extension.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/14/22.
//

import Foundation
import SwiftUI

extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}
