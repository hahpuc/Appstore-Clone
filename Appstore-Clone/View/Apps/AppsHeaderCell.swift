//
//  AppsHeaderCell.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/29/20.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Butter Royale", font: .systemFont(ofSize: 24))
    let titleLabel = UILabel(text: "Try a wild battle royale", font: .systemFont(ofSize: 20))
    
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.textColor = .lightGray
        
        companyLabel.textColor = .blue
        imageView.backgroundColor = .lightGray
        titleLabel.numberOfLines = 2
        
        let stackView = VerticalStackView(arrangedSubviews: [
            companyLabel,
            titleLabel,
            imageView
            ], spacing: 8)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    
}
