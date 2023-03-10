//
//  PuzzleCell.swift
//  Puzzle
//
//  Created by Евгений Маглена on 25.02.2023.
//

import UIKit

class PuzzleCell: UICollectionViewCell {
    static let identifier = "PuzzleCell"

    @IBOutlet weak var puzzleImage: UIImageView!
    var text = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
        self.puzzleImage.clipsToBounds = true
    }

}
