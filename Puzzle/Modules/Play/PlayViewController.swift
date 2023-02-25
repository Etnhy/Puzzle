//
//  PlayViewController.swift
//  Puzzle
//
//  Created by Евгений Маглена on 25.02.2023.
//

import UIKit

class PlayViewController: MainViewController {
    
    let levelsTopTitle: UIImageView = {
       var view = UIImageView()
        view.image = UIImage(named: "levels")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var playCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: PlayCellItem.identifier, bundle: nil), forCellWithReuseIdentifier: PlayCellItem.identifier)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainBackButton.isHidden = false
        addSubviews()
    }

    
    //MARK: - Add Subviews
    private func addSubviews() {
        view.addSubview(levelsTopTitle)
        view.addSubview(playCollectionView)
        setupConstraints()
    }
    
    //MARK: - Setup Constraints
    private func setupConstraints() {
        levelsTopTitle.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(46)
            make.size.equalTo(CGSize(width: 104, height: 53))
        }
        playCollectionView.snp.makeConstraints { make in
            make.top.equalTo(levelsTopTitle.snp.bottom).offset(60)
            make.leading.equalTo(self.view).offset(8)
            make.trailing.equalTo(self.view).inset(8)
            make.bottom.equalTo(self.view)
        }
    }

}


extension PlayViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayCellItem.identifier, for: indexPath) as? PlayCellItem else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
}
