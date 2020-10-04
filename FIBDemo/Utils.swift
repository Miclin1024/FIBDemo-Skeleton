//
//  Utils.swift
//  FIBDemo
//
//  Created by Michael Lin on 10/3/20.
//

import Foundation
import UIKit
import SwiftUI

@propertyWrapper
struct AutoLayout<T: UIView> {
    public var wrappedValue: T {
        didSet {
            setAutoLayout()
        }
    }
    
    func setAutoLayout() {
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        setAutoLayout()
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            } else if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: 1)
                    return
                }
            }
        }

        return nil
    }
}

extension UIColor {
    /// A UIColor object with hex #C62828
    static let HOTVPrimary = UIColor(hex: "#C62828")
    
    /// A UIColor object with hex #3C7FDF
    static let HOTVBlue = UIColor(hex: "#3C7FDF")
    /// A UIColor object with hex #5CB146
    static let HOTVGreen = UIColor(hex: "#5CB146")
    /// A UIColor object with hex #5856D6
    static let HOTVPurple = UIColor(hex: "#5856D6")
    /// A UIColor object with hex #ED850B
    static let HOTVOrange = UIColor(hex: "#ED850B")
    /// A UIColor object with hex #F0B225
    static let HOTVYellow = UIColor(hex: "#F0B225")
    
    /// A UIColor object with hex #EDEDED
    static let HOTVBackground = UIColor(hex: "#EDEDED")
    /// A UIColor object with hex #FFFFFF
    static let HOTVBackgroundWhite = UIColor(hex: "#FFFFFF")
    
    /// A UIColor object with hex #414141
    static let HOTVTextPrimary = UIColor(hex: "#414141")
    /// A UIColor object with hex #696969
    static let HOTVTextSecondary = UIColor(hex: "#696969")
    /// A UIColor object with hex #9F9F9F
    static let HOTVTextTertiary = UIColor(hex: "#9F9F9F")
    /// A UIColor object with hex #FFFFFF
    static let HOTVTextWhite = UIColor(hex: "#FFFFFF")
    
    /// A UIColor object with hex #F7F7F7
    static let HOTVWhite = UIColor(hex: "#F7F7F7")
    
    /// A UIColor object with hex #9F9F9F
    static let HOTVIconInactive = UIColor(hex: "#9F9F9F")
    
    /// A UIColor object with hex #EBEBEB (80% opacity)
    static let HOTVTextField = UIColor(hex: "#EBEBEBCD")
}

extension Color {
    init(hex: String) {
        let color = UIColor(hex: hex) ?? UIColor.black
        self.init(color)
    }
}

extension UIFont {
    public enum SFCompactRoundedType: String {
        case heavy = "-Heavy"
        case medium = "-Medium"
        case light = "-Light"
        case regular = "-Regular"
        case ultraLight = "-Ultralight"
        case semibold = "-Semibold"
        case black = "-Black"
        case thin = "-Thin"
        case bold = "-Bold"
    }
    
    public enum SFProDisplayType: String {
        case heavy = "-Heavy"
        case heavyItalic = "-HeavyItalic"
        case medium = "-Medium"
        case mediumItalic = "-MediumItalic"
        case light = "-Light"
        case lightItalic = "-LightItalic"
        case regular = "-Regular"
        case regularItalic = "-RegularItalic"
        case ultraLight = "-Ultralight"
        case ultraLightItalic = "-UltralightItalic"
        case semiboldItalic = "-SemiboldItalic"
        case semibold = "-Semibold"
        case black = "-Black"
        case blackItalic = "-BlackItalic"
        case thin = "-Thin"
        case thinItalic = "-ThinItalic"
        case bold = "-Bold"
        case boldItalic = "-BoldItalic"
    }
    
    public enum SFCompactDisplayType: String {
        case heavy = "-Heavy"
        case medium = "-Medium"
        case light = "-Light"
        case regular = "-Regular"
        case ultraLight = "-Ultralight"
        case semibold = "-Semibold"
        case black = "-Black"
        case thin = "-Thin"
        case bold = "-Bold"
    }
    
    public static func SFCompactRounded(type: SFCompactRoundedType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "SFCompactRounded\(type.rawValue)", size: size)!
    }
    
    public static func SFProDisplay(type: SFProDisplayType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "SFProDisplay\(type.rawValue)", size: size)!
    }
    
    public static func SFCompactDisplay(type: SFCompactDisplayType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "SFCompactDisplay\(type.rawValue)", size: size)!
    }
}
