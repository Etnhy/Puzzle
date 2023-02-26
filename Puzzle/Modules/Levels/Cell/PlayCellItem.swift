//
//  PlayCellItem.swift
//  Puzzle
//
//  Created by Евгений Маглена on 25.02.2023.
//

import UIKit

class PlayCellItem: UICollectionViewCell {
    static let identifier = "PlayCellItem"

    
    @IBOutlet weak var mainLevelImage: UIImageView!
    @IBOutlet weak var levelNumberImage: UILabel!
    
    var levelPuzzle:[String] = []
    var levelTime = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configureCell(with level: LevelData) {
        self.mainLevelImage.image = UIImage(named: level.mainLevelImage)
        self.levelNumberImage.text = "\(level.numberLevelImage)"
        self.levelPuzzle = level.levelPuzzle
        self.levelTime = level.levelTime
    }

}
