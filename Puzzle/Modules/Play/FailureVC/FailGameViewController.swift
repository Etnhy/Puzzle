//
//  FailGameViewController.swift
//  Puzzle
//
//  Created by Евгений Маглена on 26.02.2023.
//

import UIKit

class FailGameViewController: UIViewController {
    static let identifier = "FailGameViewController"
    
    @IBOutlet weak var leavetoHomeButton: UIButton!
    
    @IBOutlet weak var resetLevelButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTargets()
        // Do any additional setup after loading the view.
    }
    fileprivate func setTargets() {
        leavetoHomeButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        resetLevelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
    }

}
