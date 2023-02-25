//
//  MenuViewController.swift
//  Puzzle
//
//  Created by Евгений Маглена on 25.02.2023.
//

import UIKit

class MenuViewController: MainViewController {
    
    
    lazy var buttonStackView: UIStackView = {
       var stackView = UIStackView()
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
import SwiftUI

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewControlle = MenuViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewControlle
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
    
}
