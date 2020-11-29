//
//  ReviewController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 11/29/20.
//

import UIKit

class ReviewController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "CellID"
    
    var reviews: Reviews? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(ReviewDetailCell.self, forCellWithReuseIdentifier: cellID)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews?.feed.entry.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ReviewDetailCell
        
        let review = reviews?.feed.entry[indexPath.row]
        cell.authorLabel.text = review?.author.name.label
        cell.titleLabel.text = review?.title.label
        cell.bodyLabel.text = review?.content.label
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 16, bottom: 10, right: 16)
    }
    
    
}
