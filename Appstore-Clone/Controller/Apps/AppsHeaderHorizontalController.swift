//
//  AppsHeaderHorizontalController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/29/20.
//

import UIKit


class AppsHeaderHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellID = "123das"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView.backgroundColor = .white
        
        // Scroll horizontal Header Page
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsHeaderCell
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 16, bottom: 10, right: 16)
    }
    
}
