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
    
    let separateLine: UIImageView =  {
        let imageView = UIImageView()
        
        imageView.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9333333333, alpha: 1)
        imageView.constrainHeight(constant: 1)
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(separateLine)
        addSubview(reviewLabel)
        addSubview(reviewController.view)
        
        separateLine.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        reviewLabel.anchor(top: separateLine.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        reviewController.view.anchor(top: reviewLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
