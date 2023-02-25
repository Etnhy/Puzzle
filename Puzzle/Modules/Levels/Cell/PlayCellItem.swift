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
    @IBOutlet weak var levelNumberImage: UIImageView!
    
    var levelPuzzle:[String] = []
    var levelTime = Timer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configureCell(with level: LevelData) {
        self.mainLevelImage.image = UIImage(named: level.mainLevelImage)
        self.levelNumberImage.image = UIImage(named: level.numberLevelImage)
        self.levelPuzzle = level.levelPuzzle
        guard let leveltime = level.levelTime else { return }
        self.levelTime = leveltime
    }

}
