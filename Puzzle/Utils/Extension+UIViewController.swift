//
//  Extension+UIViewController.swift
//  Puzzle
//
//  Created by Евгений Маглена on 27.02.2023.
//

import Foundation
import UIKit

extension UIViewController {
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
}
