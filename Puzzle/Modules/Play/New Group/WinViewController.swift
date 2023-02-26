//
//  WinViewController.swift
//  Puzzle
//
//  Created by Евгений Маглена on 26.02.2023.
//

import UIKit

class WinViewController: UIViewController {
    static let identifier = "WinViewController"

    @IBOutlet weak var winLab: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addGestures()
        
    }
    

    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
        self.winLab.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(tap)
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
