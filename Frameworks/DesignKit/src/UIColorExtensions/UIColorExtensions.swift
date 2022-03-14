//
//  Spacing.swift
//  
//
//  Created by 刁爷 on 2022/3/11.
//

import UIKit

@available(iOS 13.0, *)
public extension UIColor {
    static let designKit = DesignKitPalette.self

    @available(iOS 13.0, *)
    enum DesignKitPalette {
        public static let primary: UIColor = dynamicColor(light: UIColor(hex: 0x770e3), dark: UIColor(hex: 0x6d9feb, alpha: 0.8))
        public static let background: UIColor = dynamicColor(light: .white, dark: .purple)
        public static let secondaryBackground: UIColor = dynamicColor(light: .purple, dark: .white)
        public static let tertiaryBackground: UIColor = dynamicColor(light: UIColor(hex: 0x770e3), dark: UIColor(hex: 0x6d9feb, alpha: 0.8))
        public static let line: UIColor = dynamicColor(light: UIColor(hex: 0x770e3), dark: UIColor(hex: 0x6d9feb, alpha: 0.8))
        public static let primaryText: UIColor = dynamicColor(light: .black, dark: .white)
        public static let secondaryText: UIColor = dynamicColor(light: UIColor(hex: 0x770e3), dark: UIColor(hex: 0x6d9feb, alpha: 0.8))
        public static let tertiaryText: UIColor = dynamicColor(light: UIColor(hex: 0x770e3), dark: UIColor(hex: 0x6d9feb, alpha: 0.8))
        public static let quaternaryText: UIColor = dynamicColor(light: UIColor(hex: 0x770e3), dark: UIColor(hex: 0x6d9feb, alpha: 0.8))

        @available(iOS 13.0, *)
        static private func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
            return UIColor {
                $0.userInterfaceStyle == .dark ? dark: light
            }
        }
    }
}

public extension UIColor {
    convenience init(hex: Int) {
        let com = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: com.R, green: com.G, blue: com.B, alpha: 1)
    }

    convenience init(hex: Int, alpha: CGFloat) {
        let com = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: com.R, green: com.G, blue: com.B, alpha: alpha)
    }
}
