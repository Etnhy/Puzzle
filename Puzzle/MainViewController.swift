//
//  ViewController.swift
//  Puzzle
//
//  Created by Евгений Маглена on 25.02.2023.
//

import UIKit
import SnapKit

enum CandyPosition {
    case defaultPosition
    case loadingPosition
}

class MainViewController: UIViewController {
    
    let backgroundImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "background")

        return image

    }()
    
    
    let backgroundImageCandy: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "candy")
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBackground()
    }
    
    fileprivate func setupBackground() {
        view.addSubview( backgroundImage )
        backgroundImage.addSubview(backgroundImageCandy)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.view)
            make.leading.trailing.equalTo(self.view)
        }
        backgroundImageCandy.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.top).offset(70)
            make.size.equalTo(CGSize(width: 350, height: 233))
            make.leading.equalTo(self.view).offset(20)
        }
    }


}

import SwiftUI

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewControlle = MainViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewControlle
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
    
}
