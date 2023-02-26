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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        addGestures()
        
        
    }
    @objc func cancelTapped() {
        if parent!.children.count > 0 {
            let mainChildren = parent!.children
            
            mainChildren.forEach { child in
                let childName = String(describing: child.self)
                let currentVCName = String(describing: self)
                
                if childName == currentVCName {
                    child.willMove(toParent: nil)
                    child.view.removeFromSuperview()
                    child.removeFromParent()
                    
                }
            }
        }
    }

    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer?) {
            self.dismiss(animated: true, completion: nil)
    }

}

//MARK: - UIGestureRecognizerDelegate
extension WinViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print(touch)

        return touch.view == gestureRecognizer.view
    }
}
