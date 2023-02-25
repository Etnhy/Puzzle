//
//  MenuButtonsSettings.swift
//  Puzzle
//
//  Created by Евгений Маглена on 25.02.2023.
//

import Foundation

enum MenuButtons: CaseIterable {
    case play
    case gameRules
    case settings
    case privacyPolicy
    
    var buttonImages: String {
        switch self {
        case .play: return "play"
        case .gameRules: return "game_rules"
        case .settings: return "settings"
        case .privacyPolicy: return "privacy_policy"
        }
    }
    var buttonsTitle: String {
        switch self {
        case .play: return "Play"
        case .gameRules: return "Game Rules"
        case .settings: return "Settings"
        case .privacyPolicy: return "PrivacyPolicy"
        }
    }
    
    var backGroundImage: String {
        return "buttonbackground"
    }
    var setIndex: Int {
        switch self {
        case .play: return 0
        case .gameRules: return 1
        case .settings: return 2
        case .privacyPolicy: return 3
        }
    }
}
