//
//  SettingsViewController.swift
//  Puzzle
//
//  Created by Евгений Маглена on 26.02.2023.
//

import UIKit
import AVFoundation
import StoreKit

class SettingsViewController: MainViewController {
    
    
    fileprivate let player = AVPlayer()
    fileprivate var isVibration: Bool = true
    
     //MARK: -  sound
    let soundButton: UIButton = {
       var sound = UIButton()
        return sound
    }()
    
    let soundCheckbox: UIButton = {
       var button = UIButton()
        button.setBackgroundImage(UIImage(named: "checked=yes"), for: .normal)
        return button
    }()
    
     //MARK: -  vibro
    let vibroButton: UIButton = {
       var sound = UIButton()
        return sound
    }()
    
    let vibroCheckbox: UIButton = {
       var button = UIButton()
        button.setBackgroundImage(UIImage(named: "checked=yes"), for: .normal)
        return button
    }()
    
     //MARK: -  rate us
    let rateUsButton: UIButton = {
       var rateus = UIButton()
        
        return rateus
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundImageCandy.isHidden = true
        self.mainBackButton.isHidden = false
        setupView()
        setupButtonConfig()
        setupActions()
    }

    fileprivate func setupView() {
        self.view.addSubview(soundButton)
        self.view.addSubview(soundCheckbox)
        
        self.view.addSubview(vibroButton)
        self.view.addSubview(vibroCheckbox)
        self.view.addSubview(rateUsButton)
        let img = setupTopImage(imageName: "settings")
        self.view.addSubview(img)
        img.snp.makeConstraints { make in
            make.top.equalTo(view).offset(60)
            make.centerX.equalTo(self.view)
        }
        
        soundButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(200)
            make.size.equalTo(CGSize(width: 274, height: 70))
            make.leading.equalTo(self.view).offset(16)
        }
        soundCheckbox.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 60, height: 60))
            make.centerY.equalTo(soundButton)
            make.leading.equalTo(soundButton.snp.trailing).offset(16)
        }
        
        vibroButton.snp.makeConstraints { make in
            make.top.equalTo(soundButton.snp.bottom).offset(16)
            make.size.equalTo(CGSize(width: 274, height: 70))
            make.leading.equalTo(self.view).offset(16)
        }
        
        vibroCheckbox.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 60, height: 60))
            make.centerY.equalTo(vibroButton)
            make.leading.equalTo(vibroButton.snp.trailing).offset(16)
        }
        rateUsButton.snp.makeConstraints { make in
            make.top.equalTo(vibroButton.snp.bottom).offset(16)
            make.size.equalTo(CGSize(width: 350, height: 70))
//            make.centerX.equalTo(view)
            make.leading.equalTo(self.view).offset(16)
            
        }
    }
    
    fileprivate func setupButtonConfig() {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .clear
        config.background.image = UIImage(named: "buttonbackground")
        
        self.soundButton.configuration = config
        self.soundButton.setAttributedTitle(NSAttributedString(string: "Sound",attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .bold)])
                                            , for: .normal)
        self.vibroButton.configuration = config
        self.vibroButton.setAttributedTitle(NSAttributedString(string: "Vibro",attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .bold)])
                                            , for: .normal)
        self.rateUsButton.configuration = config
        self.rateUsButton.setAttributedTitle(NSAttributedString(string: "Rate Us",attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .bold)])
                                             , for: .normal)

    }
    fileprivate func setupActions() {
        self.soundButton.addTarget(self, action: #selector(onofSound), for: .touchUpInside)
        self.soundCheckbox.addTarget(self, action: #selector(onofSound), for: .touchUpInside)
        
        self.vibroButton.addTarget(self, action: #selector(onofVibro), for: .touchUpInside)
        self.vibroCheckbox.addTarget(self, action: #selector(onofVibro), for: .touchUpInside)
        
        self.rateUsButton.addTarget(self, action: #selector(rateUsAction), for: .touchUpInside)
    }
     //MARK: -  Actions
    
    @objc private func onofSound() {
        player.isMuted.toggle()
        if player.isMuted {
            self.soundCheckbox.setImage(UIImage(named: "checked=yes"), for: .normal)
        } else {
            self.soundCheckbox.setImage(UIImage(named: "checked=no"), for: .normal)
        }
    }
    
    @objc private func onofVibro() {
        isVibration.toggle()
        if isVibration {
            self.vibroCheckbox.setImage(UIImage(named: "checked=yes"), for: .normal)
        } else {
            self.vibroCheckbox.setImage(UIImage(named: "checked=no"), for: .normal)
        }
    }
    
    @objc private func rateUsAction() {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/id479516143?mt=8&action=write-review") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}

import SwiftUI

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewControlle = SettingsViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewControlle
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
    
}
