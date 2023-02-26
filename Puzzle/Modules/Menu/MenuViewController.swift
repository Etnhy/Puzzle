//
//  MenuViewController.swift
//  Puzzle
//
//  Created by Евгений Маглена on 25.02.2023.
//

import UIKit


class MenuViewController: MainViewController {
    lazy var menuButtons: [UIButton] = {
        var buttons = [UIButton]()
        MenuButtons.allCases.forEach { button in
            var butt = UIButton()
            var config = UIButton.Configuration.tinted()
            config.background.image = UIImage(named: button.backGroundImage)
            config.baseForegroundColor = UIColor.white
            
            config.attributedTitle = AttributedString(button.buttonsTitle, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .bold)]) )
            butt.tag = button.setIndex
            butt.configuration = config
            butt.addTarget(self, action: #selector(buttonsAction(_:)), for: .touchUpInside)
            buttons.append(butt)
        }
        return buttons
    }()
    
    lazy var buttonStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: menuButtons)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }

    
    //MARK: - Add Subviews
    private func addSubviews() {
        self.view.addSubview(buttonStackView)
        setupConstraints()
    }
    
    //MARK: - Setup Constraints
    private func setupConstraints() {
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(self.backgroundImageCandy.snp.bottom).offset(40)
            make.leading.equalTo(self.view).offset(16)
            make.trailing.equalTo(self.view).inset(16)
            make.bottom.equalTo(self.view).inset(180)
        }
    }
}

 //MARK: -  buttons Actions extension
extension MenuViewController {
    @objc fileprivate func buttonsAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.navigationController?.pushViewController(LevelsViewController(), animated: true)
        case 1: print("1")
        case 2:
            self.navigationController?.pushViewController(SettingsViewController(), animated: true)
        case 3: print("3")
        default: break
            
        }
    }
}

