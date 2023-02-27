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
    
    
    @IBOutlet weak var backCandyView: UIView!
    @IBOutlet weak var candyImage: UIImageView!
    
    @IBOutlet weak var candyslice: UIImageView!
    
    var levelPuzzle:[String] = []
    var levelTime = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backCandyView.layer.cornerRadius = 10
        // Initialization code
        showCandy(boolean: false)
    }
    public func configureCell(with level: LevelData) {
        self.mainLevelImage.image = UIImage(named: level.mainLevelImage)
        self.levelNumberImage.text = "\(level.numberLevelImage)"
        self.levelPuzzle = level.levelPuzzle
        self.levelTime = level.levelTime
        showCandy(boolean: level.isComplete)
    }
    
    fileprivate func showCandy(boolean: Bool) {
        self.backCandyView.isHidden  = boolean
        self.candyImage.isHidden  = boolean
        self.candyslice.isHidden  = boolean
    }

}
