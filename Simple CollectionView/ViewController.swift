//
//  ViewController.swift
//  Simple CollectionView
//
//  Created by Jin Kato on 5/26/17.
//  Copyright © 2017 Jin Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK : Properties
    
    let cellId = "collectionCell"
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .blue
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    //MARK : Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutCollectionView()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //MARK : Layout
    
    fileprivate func layoutCollectionView(){
        view.addSubview(collectionView)
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}

//MARK: Delegate

extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}

//MARK: DataSource

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
}

//MARK: DelegateFlowLayout

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
