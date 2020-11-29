//
//  ReviewDetailCell.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 11/29/20.
//

import UIKit

class ReviewDetailCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 18))
    
    let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
    
    let starLabel = UILabel(text: "Star", font: .systemFont(ofSize: 14))
    
    let bodyLabel = UILabel(text: "Body label \nBody label \nBody label", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.9450011849, green: 0.9406232238, blue: 0.9736520648, alpha: 1)
        
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
                titleLabel, UIView(), authorLabel
            ]),
            starLabel,
            bodyLabel
        ], spacing: 16)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
