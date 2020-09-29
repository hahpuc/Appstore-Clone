//
//  AppRowCell.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/29/20.
//

import UIKit


class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLabel = UILabel(text: "App name", font: .systemFont(ofSize: 20))
    
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .purple
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 32/2
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        let labelVerticalStackView = VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4)
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView, labelVerticalStackView, getButton
        ])
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

