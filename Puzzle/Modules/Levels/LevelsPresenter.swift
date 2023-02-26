//
//  PlayPresenter.swift
//  Puzzle
//
//  Created by Евгений Маглена on 25.02.2023.
//

import Foundation

protocol LevelsProtocol: AnyObject {
    func setLevels(levels:[LevelData])
}
protocol LevelsViewProtocol: AnyObject {
    init(view: LevelsProtocol)
    func createLevelData()
    func createLevelsCount() -> Int
}


class LevelsPresenter: LevelsViewProtocol {
    
    
    weak var view: LevelsProtocol?
    required init(view: LevelsProtocol) {
        self.view = view
        createLevelData()
    }
    
    func createLevelData() {
        self.view?.setLevels(levels: levels)
        print("create level data")
    }
    func createLevelsCount() -> Int {
        return levels.count
    }
    
}


let levels = [
    LevelData(
        mainLevelImage: "level_mainImg_1",winLevelPictures: "win_level_1",
        numberLevelImage: "1",
        levelPuzzle: ["1_levelpic","2_levelpic","3_levelpic","4_levelpic","5_levelpic","6_levelpic","7_levelpic","8_levelpic","9_levelpic","10_levelpic","11_levelpic","12_levelpic","13_levelpic","14_levelpic","15_levelpic","16_levelpic",],
        levelTime: 180),
    LevelData(
        mainLevelImage: "level_mainImg_2",winLevelPictures: "win_level_2",
        numberLevelImage: "2",
        levelPuzzle: ["1_level2pic","2_level2pic","3_level2pic","4_level2pic","5_level2pic","6_level2pic","7_level2pic","8_level2pic","9_level2pic","10_level2pic","11_level2pic","12_level2pic","13_level2pic","14_level2pic","15_level2pic","16_level2pic",],
        levelTime: 170),
    LevelData(
        mainLevelImage: "level_mainImg_3",winLevelPictures: "win_level_3",
        numberLevelImage: "3",
        levelPuzzle: ["1_level3pic","2_level3pic","3_level3pic","4_level3pic","5_level3pic","6_level3pic","7_level3pic","8_level3pic","9_level3pic","10_level3pic","11_level3pic","12_level3pic","13_level3pic","14_level3pic","15_level3pic","16_level3pic",],
        levelTime: 160),
]
