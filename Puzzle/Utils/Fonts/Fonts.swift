//
//  Fonts.swift
//  Puzzle
//
//  Created by Евгений Маглена on 26.02.2023.
//

import Foundation
import UIKit

extension UIFont {
    private static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    static func knewaveRegular(ofSize: CGFloat) -> UIFont {
        return customFont(name: "Knewave Regular", size: ofSize)
    }
    static func KnewaveOutlineRegular(ofSize: CGFloat) -> UIFont {
        return customFont(name: "Knewave Outline Regular", size: ofSize)
    }
}
