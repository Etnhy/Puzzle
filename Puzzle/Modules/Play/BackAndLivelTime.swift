//
//  BackAndLivelTime.swift
//  Puzzle
//
//  Created by Евгений Маглена on 26.02.2023.
//

import UIKit
import SnapKit


class BackAndLivelTime: UIView {
    
    let backView = UIImageView()
    let titleLabel = UILabel()

    var titleString = ""
    init() {
        super.init(frame: .zero)
//        guard let titleString = titleString else { return }
//        self.titleLabel.text = "LVL-\(titleString)"
        self.titleLabel.text = titleString
        setupView()

    }
    fileprivate func setupView() {
        self.addSubview(backView)
        self.addSubview(titleLabel)
        
        backView.image = UIImage(named: "imgBack")
        titleLabel.textAlignment = .center
        titleLabel.font = .knewaveRegular(ofSize: 24)
        titleLabel.textColor = UIColor(red: 0.74, green: 0.12, blue: 0.60, alpha: 1.00)

        
        
        self.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 100, height: 37))
        }
        
        backView.snp.remakeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(self)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

