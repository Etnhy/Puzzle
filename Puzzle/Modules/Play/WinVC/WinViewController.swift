//
//  WinViewController.swift
//  Puzzle
//
//  Created by Евгений Маглена on 26.02.2023.
//

import UIKit


class WinViewController: UIViewController {
    static let identifier = "WinViewController"
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var bestTimeLabel: UILabel!
    @IBOutlet weak var nextLevelButton: UIButton!
    @IBOutlet weak var repeatLevelButton: UIButton!
    @IBOutlet weak var leaveToHomeButton: UIButton!
    
    private var setTime = "awwwwk"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupACtions()
        

    }
    fileprivate func setupACtions() {
        leaveToHomeButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        repeatLevelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        nextLevelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)

    }
}

