//
//  ViewController.swift
//  Puzzle
//
//  Created by Евгений Маглена on 25.02.2023.
//

import UIKit
import SnapKit


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
    
    
    lazy var mainBackButton: UIButton = {
       var view = UIButton()
         view.setBackgroundImage(UIImage(named: "ellipse"), for: .normal)
         view.addTarget(self, action: #selector(didTapDismissOrPop), for: .touchUpInside)
         view.setImage(UIImage(named: "backArrow"), for: .normal)
         return view
    }()
    
    let strokeTextAttributes: [NSAttributedString.Key : Any] = [
        .strokeColor : UIColor(red: 1.00, green: 0.20, blue: 0.82, alpha: 1.00),
        .foregroundColor : UIColor.white,
        .strokeWidth : -3.0,
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        mainBackButton.isHidden = true
        setupBackground()
    }
    
    fileprivate func setupBackground() {
        view.addSubview( backgroundImage )
        view.addSubview(mainBackButton)
        backgroundImage.addSubview(backgroundImageCandy)
        setupConstraints()
    }
    @objc func didTapDismissOrPop() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
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
        mainBackButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaInsets.top).offset(46)
            make.leading.equalTo(self.view).offset(16)
            make.size.equalTo(CGSize(width: 60, height: 60))
        }
        mainBackButton.imageView?.snp.makeConstraints({ make in
            make.size.equalTo(CGSize(width: 22, height: 37))
        })
    }
    public func setupTopImage(imageName: String) -> UILabel {
        let topImage = UILabel()
        topImage.font = .knewaveRegular(ofSize: 34)
        topImage.textColor = .white
        topImage.attributedText = NSAttributedString(string: imageName,attributes: strokeTextAttributes)
        topImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 146, height: 53))
        }
        return topImage
    }


}


