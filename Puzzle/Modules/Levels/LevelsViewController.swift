//
//  PlayViewController.swift
//  Puzzle
//
//  Created by Евгений Маглена on 25.02.2023.
//

import UIKit

class LevelsViewController: MainViewController {
    
    fileprivate var mainLevels = levels
    
    let levelsTopTitle: UIImageView = {
       var view = UIImageView()
        view.image = UIImage(named: "levels")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var levelsCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        collection.register(UINib(nibName: PlayCellItem.identifier, bundle: nil), forCellWithReuseIdentifier: PlayCellItem.identifier)
        return collection
    }()

    
    var presenter: LevelsPresenter?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.levelsCollectionView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = LevelsPresenter(view: self)
        self.mainBackButton.isHidden = false
        addSubviews()
    }

    
    //MARK: - Add Subviews
    private func addSubviews() {
        view.addSubview(levelsTopTitle)
        view.addSubview(levelsCollectionView)
        setupConstraints()
    }
    
    //MARK: - Setup Constraints
    private func setupConstraints() {
        levelsTopTitle.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(46)
            make.size.equalTo(CGSize(width: 104, height: 53))
        }
        levelsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(levelsTopTitle.snp.bottom).offset(60)
            make.leading.equalTo(self.view).offset(8)
            make.trailing.equalTo(self.view).inset(8)
            make.bottom.equalTo(self.view)
        }
    }

}


extension LevelsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter!.createLevelsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayCellItem.identifier, for: indexPath) as? PlayCellItem else {
            return UICollectionViewCell()
        }
        cell.configureCell(with: levels[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(PlayViewController(
             //MARK: - NEED USOLVED
            unsolvedImages: mainLevels[indexPath.item].levelPuzzle,
            solvedImages: mainLevels[indexPath.item].levelPuzzle,
            winPic: mainLevels[indexPath.item].winLevelPictures,
            remainingTime: mainLevels[indexPath.item].levelTime,
            levelNumber: mainLevels[indexPath.item].levelNumber), animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
}
extension LevelsViewController: LevelsProtocol {
    func setLevels(levels: [LevelData]) {
        self.mainLevels = levels
    }
    
    
}

