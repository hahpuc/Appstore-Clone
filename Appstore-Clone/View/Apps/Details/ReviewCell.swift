//
//  ReviewCell.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 11/29/20.
//

import UIKit


class ReviewCell: UICollectionViewCell {
    
    let reviewLabel = UILabel(text: "Review & Ratings", font: .boldSystemFont(ofSize: 20))
    
    let reviewController = ReviewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(reviewLabel)
        addSubview(reviewController.view)
        
        reviewLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        reviewController.view.anchor(top: reviewLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
