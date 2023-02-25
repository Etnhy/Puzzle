//
//  PlayViewController.swift
//  Puzzle
//
//  Created by Евгений Маглена on 25.02.2023.
//

import UIKit

class PlayViewController: MainViewController {
    
    lazy var backGroundFrameImageView: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named:"candy_frame")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var playCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
                layout.minimumLineSpacing = 2
                layout.minimumInteritemSpacing = 2
        var view = UICollectionView(frame: .zero,collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(UINib(nibName: PuzzleCell.identifier, bundle: nil), forCellWithReuseIdentifier: PuzzleCell.identifier)
        view.backgroundColor = .clear
        view.backgroundColor = .yellow
        return view
    }()
    var playImagesString:[String]
    
    init(playImagesString: [String]) {
        self.playImagesString = playImagesString
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(_:)))
        playCollectionView.addGestureRecognizer(longPressGesture)
        setupView()
        
    }
    @objc private func longPressed(_ gesture: UILongPressGestureRecognizer) {
        let gestureLocation = gesture.location(in: self.playCollectionView)
        switch gesture.state {
        case .began:
            guard let targetIndexPath = playCollectionView.indexPathForItem(at: gestureLocation) else { return }
            self.playCollectionView.beginInteractiveMovementForItem(at: targetIndexPath)
        case .changed:
            self.playCollectionView.updateInteractiveMovementTargetPosition(gestureLocation)
        case .ended:
            self.playCollectionView.endInteractiveMovement()
        default:
            self.playCollectionView.cancelInteractiveMovement()
        }
        
    }
    fileprivate func setupView () {
        view.addSubview(playCollectionView)
        view.addSubview(backGroundFrameImageView)

                backGroundFrameImageView.snp.makeConstraints { make in
                    make.top.equalTo(self.view).offset(118)
                    make.leading.equalTo(self.view).offset(4)
                    make.trailing.equalTo(self.view).inset(4)
                    make.height.equalTo(357)
                    make.centerX.equalTo(self.view)
                }
        playCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(120)
            make.leading.equalTo(self.view).offset(30)
            make.trailing.equalTo(self.view).inset(30)
            make.bottom.equalTo(self.view)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
extension PlayViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playImagesString.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PuzzleCell.identifier, for: indexPath) as? PuzzleCell else {
            return UICollectionViewCell()
        }
        cell.puzzleImage.image = UIImage(named: playImagesString[indexPath.item])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85)
    }
}
extension PlayViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = playImagesString.remove(at: sourceIndexPath.row)
        playImagesString.insert(item, at: destinationIndexPath.row)
    }
}


import SwiftUI

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewControlle = PlayViewController(playImagesString: [])
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewControlle
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
    
}
