//
//  UIextension.swift
//  Kolibriapp
//
//  Created by Brontosaurus on 23/09/23.
//

import SwiftUI

enum robotoSans: String {
    case regular = "Roboto-Regular"
    case medium = "Roboto-Medium"
}

extension Font {
    static func customFont(_ font: robotoSans, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
