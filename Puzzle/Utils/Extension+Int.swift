//
//  Extension+String.swift
//  Puzzle
//
//  Created by Евгений Маглена on 26.02.2023.
//

import Foundation

extension Int {
    func formatTime() -> String {
        let minutes = self / 60
        let seconds = self % 60
        let formattedTime = String(format: "%02d:%02d", minutes, seconds)
        return formattedTime
    }
}
