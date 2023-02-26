//
//  GameData.swift
//  Puzzle
//
//  Created by Евгений Маглена on 25.02.2023.
//

import Foundation

struct LevelData {
    let mainLevelImage: String
    let winLevelPictures: String
    let numberLevelImage: String
    let levelPuzzle: [String]
    let levelTime: Timer?
    
    var unsolvedImages: [String] {
        return levelPuzzle.shuffled()
    }
}
